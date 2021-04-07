﻿using KurbSide.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using KurbSide.Service;
using KurbSide.Utilities;
using KurbSideUtils;

namespace KurbSide.Controllers
{
    [Authorize]
    public class BusinessController : Controller
    {
        private readonly KSContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<Business> _logger;

        public BusinessController(KSContext context, UserManager<IdentityUser> userManager, ILogger<Business> logger)
        {
            _context = context;
            _userManager = userManager;
            _logger = logger;
        }

        #region BusinessRU
        public async Task<IActionResult> IndexAsync()
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);
            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business.FirstOrDefaultAsync(b => b.AspNetId.Equals(user.Id));

            return View(business);
        }

        public async Task<IActionResult> EditBusiness()
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            ViewData["CountryCode"] = new SelectList(_context.Country, "CountryCode", "FullName", business.ProvinceCode);
            ViewData["ProvinceCode"] = new SelectList(_context.Province, "ProvinceCode", "FullName", business.ProvinceCode);

            return View(business);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditBusiness(Guid id, Business business, IFormFile businessLogo)
        {
            //Check that the accessing user is a business type account
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            //Check that the business being edited is the signed in business
            if (id != business.BusinessId)
            {
                _logger.LogDebug("ID Mismatch. Edit not performed.");
                return RedirectToAction("Index");
            }

            try
            {
                if (ModelState.IsValid)
                {
                    if(businessLogo != null) // If the business has added an image, it is uploaded to imgur and the link is prepped to be saved to the DB
                    {
                        string uploadResults = await KSImgur.KSUploadImageToImgur(businessLogo);
                        if (!uploadResults.StartsWith("Error: "))
                        {
                            business.LogoLocation = uploadResults;
                        }
                        else
                        {
                            var existingBusiness = await _context.Business.AsNoTracking().Where(b => b.BusinessId == business.BusinessId).FirstOrDefaultAsync();
                            string existingImage = existingBusiness.LogoLocation;
                            business.LogoLocation = existingImage;
                            TempData["sysMessage"] = uploadResults + ", Logo not changed";
                        }
                    }
                    else // If they are not adding a new image, it uses the pre-existing image.
                    {
                        var existingBusiness = await _context.Business.AsNoTracking().Where(b => b.BusinessId == business.BusinessId).FirstOrDefaultAsync();
                        string existingImage = existingBusiness.LogoLocation;
                        business.LogoLocation = existingImage;
                    }
                    
                    string address = $"{business.Street} {business.City} {business.ProvinceCode} {business.CountryCode} {business.Postal}";
                    Service.Location location = await Service.GeoCode.GetLocationAsync(address);

                    business.Lng = location.lng;
                    business.Lat = location.lat;

                    _context.Update(business);
                    await _context.SaveChangesAsync();
                    _logger.LogDebug($"Edit succeeded. {business.BusinessId}");
                    return RedirectToAction("Index");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                _logger.LogError("Business does not exist, Update Failed.");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error: {ex.GetBaseException().Message}. Edit not performed.");
                return RedirectToAction("Index");
            }

            ViewData["CountryCode"] = new SelectList(_context.Country, "CountryCode", "FullName", business.ProvinceCode);
            ViewData["ProvinceCode"] = new SelectList(_context.Province, "ProvinceCode", "FullName", business.ProvinceCode);
            return View(business);
        }
        #endregion

        #region ItemCRUD
        public async Task<IActionResult> Catalogue(string filter = "", int page = 1, int perPage = 5)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            //Retrieve items associated with the editing business
            //  skip items that are marked as removed
            //  TODO separate items to a separate list somewhere to be re-added
            var items = await _context.Item
                .Where(i => i.BusinessId.Equals(business.BusinessId))
                .Include(i => i.Business)
                .Where(i => i.Removed == false)
                .OrderByDescending(i => i.Category)
                .ToListAsync();

            //Retrieve the user-defined categories
            var categories = items
                .Select(i => i.Category)
                .Distinct()
                .ToList();

            //Filtering functions
            if (!string.IsNullOrEmpty(filter))
            {
                TempData["catalogueFilter"] = filter;
                //sort by category if the search term/filter
                //  is contained in the categories list
                if (categories.Contains(filter))
                {
                    items = items
                        .Where(i => i.Category.Equals(filter))
                        .ToList();
                }
                //sort by name if the search term/filter
                //  is not contained in the categories list
                else
                {
                    items = items
                        .Where(i => i.ItemName.ToLower().Contains(filter.ToLower()))
                        .ToList();
                }
            }

            //Create the paginated list for return
            var paginatedList = KurbSideUtils.KSPaginatedList<Item>.Create(items.AsQueryable(), page, perPage);

            //Gather temp data and pagination/filter info
            //  all in to one place for use 
            TempData["itemCategories"] = categories;
            TempData["currentPage"] = page;
            TempData["totalPage"] = paginatedList.TotalPages;
            TempData["perPage"] = perPage;
            TempData["hasNextPage"] = paginatedList.HasNextPage;
            TempData["hasPrevPage"] = paginatedList.HasPreviousPage;

            return View(paginatedList);
        }
        public async Task<IActionResult> RemoveItem(Guid id, string filter = "", int page = 1, int perPage = 5)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var item = await _context.Item
                .Where(i => i.BusinessId.Equals(business.BusinessId))
                .Where(i => i.ItemId.Equals(id))
                .FirstOrDefaultAsync();

            try
            {
                //Throw an exception forcing items to be hidden instead of removed
                throw new Exception("");
                //_context.Item.Remove(item);
                //_logger.LogDebug("Debug: Item not present in any orders, Removed From Database.");
            }
            catch (Exception)
            {
                try
                {
                    if (item == null) throw new Exception();
                    item.Removed = true;
                    _context.Item.Update(item);
                    _logger.LogDebug("Debug: Item is present in orders, Marked as Hidden/Removed.");
                }
                catch (Exception)
                {
                    // ignored
                }
            }
            finally
            {
                await _context.SaveChangesAsync();
            }

            return RedirectToAction("Catalogue", new {filter, page, perPage});
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddItem(Guid id, Item item, IFormFile itemImage)
        {
            //Check that the accessing user is a business type account
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            //Ensure that the business can only add items for themselves
            if (id != item.BusinessId)
            {
                _logger.LogDebug("Debug: Id Mismatch. Edit not performed.");
                return RedirectToAction("Index");
            }

            try
            {
                if (ModelState.IsValid)
                {
                    if(itemImage != null) // If the business has added an image, it is uploaded to imgur and the link is prepped to be saved to the DB
                    {
                        string linkToImage = await KSImgur.KSUploadImageToImgur(itemImage);
                        if(!linkToImage.StartsWith("Error: "))
                        {
                            item.ImageLocation = linkToImage;

                        }
                        else
                        {
                            TempData["sysMessage"] = linkToImage + ", Image not added";
                        }
                    }

                    _context.Item.Add(item);
                    await _context.SaveChangesAsync();
                    _logger.LogDebug("Debug: Add succeeded. {item.ItemId}");
                    return RedirectToAction("Catalogue");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                _logger.LogError("Error: Business does not exist, Add Failed.");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error: {ex.GetBaseException().Message}. Add not performed.");
                return RedirectToAction("Index");
            }
            return View(item);
        }
        public async Task<IActionResult> AddItem()
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var blankItem = new Item
            {
                BusinessId = business.BusinessId,
                Business = business
            };

            return View(blankItem);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditItem(Guid id, Item item, IFormFile itemImageEdit)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            //Ensure that the business can only edit items for themselves
            if (id != item.BusinessId)
            {
                _logger.LogDebug("Debug: Id Mismatch. Update not performed.");
                return RedirectToAction("Index");
            }

            try
            {
                if (ModelState.IsValid)
                {
                    if(itemImageEdit != null) // If the business has added an image, it is uploaded to imgur and the link is prepped to be saved to the DB
                    {
                        var uploadResults = await KSImgur.KSUploadImageToImgur(itemImageEdit);
                        if (!uploadResults.StartsWith("Error: "))
                        {
                            item.ImageLocation = uploadResults;
                        }
                        else
                        {
                            var existingItem = await _context.Item.AsNoTracking().Where(i => i.ItemId == item.ItemId).FirstOrDefaultAsync();
                            string existingImage = existingItem.ImageLocation;
                            item.ImageLocation = existingImage;
                            TempData["sysMessage"] = uploadResults + ", Image not changed";
                        }
                    }
                    else // If they are not adding a new image, it uses the pre-existing image.
                    {
                        var existingItem = await _context.Item.AsNoTracking().Where(i => i.ItemId == item.ItemId).FirstOrDefaultAsync();
                        var existingImage = existingItem.ImageLocation;
                        item.ImageLocation = existingImage;
                    }

                    _context.Item.Update(item);
                    await _context.SaveChangesAsync();
                    _logger.LogDebug($"Debug: Update succeeded. {item.ItemId}");
                    return RedirectToAction("Catalogue");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                _logger.LogError($"Error: Business does not exist, Update Failed.");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error: {ex.GetBaseException().Message}. Update not performed.");
                return RedirectToAction("Index");
            }

            return View(item);
        }
        public async Task<IActionResult> EditItem(Guid id)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var item = await _context.Item
                .Where(i => i.BusinessId.Equals(business.BusinessId))
                .Where(i => i.ItemId.Equals(id))
                .FirstOrDefaultAsync();

            if (item == null)
            {
                return RedirectToAction("Index");
            }

            return View(item);
        }
        #endregion
        
        #region Orders

        public async Task<IActionResult> EditOrder()
        {
            return View("Orders/Edit");
        }

        public async Task<IActionResult> Orders(string filter = "", int page = 1, int perPage = 5)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var orders = await _context.Order
                .Where(o => o.Business.BusinessId.Equals(business.BusinessId))
                .Include(o => o.Member)
                .Include(o => o.StatusNavigation)
                .OrderBy(o => o.Status)
                .ToListAsync();
            
            //Retrieve the existing status(es) that are relevant
            //to the current business
            var status = orders
                .Select(o => o.StatusNavigation.StatusName.ToUpper().Trim())
                .Distinct()
                .ToList();

            //Filtering functions
            if (!string.IsNullOrEmpty(filter))
            {
                filter = filter.Trim();
                TempData["filter"] = filter;
                //sort by category if the search term/filter
                //  is contained in the categories list
                if (status.Contains(filter.ToUpper()))
                {
                    orders = orders
                        .Where(o => o.StatusNavigation.StatusName.ToUpper().Equals(filter))
                        .ToList();
                }
                //try filtering orders in the following order
                // 1. OrderId
                // 2. FirstName
                // 3. LastName
                //HACK: this is a ham-fisted way to do this, but it is unlikely
                // that any user will be named 22BBF0/etc so there should be very little
                // collision.
                else
                {
                    orders = orders
                        .Where
                            (o =>
                            o.OrderId.ToString().ToUpper().Contains(filter.ToUpper()) ||
                            o.Member.FirstName.ToUpper().Contains(filter.ToUpper()) ||
                            o.Member.LastName.ToUpper().Contains(filter.ToUpper()))
                        .ToList();
                    
                    if (orders.Count() == 1)
                    {
                        //this seems like an excellent idea :)
                        TempData["sysMessage"] = $"Only one order found for {filter}, redirecting to order.";
                        return RedirectToAction("EditOrder", new {id = orders.First().OrderId});
                    }
                }
            }
            
            var paginatedList = KSPaginatedList<Order>.Create(orders.AsQueryable(), page, perPage);

            //Gather temp data and pagination/filter info
            //  all in to one place for use 
            TempData["status"] = status;
            TempData["statusFull"] = await _context.OrderStatus.ToListAsync();
            TempData["currentPage"] = page;
            TempData["totalPage"] = paginatedList.TotalPages;
            TempData["perPage"] = perPage;
            TempData["hasNextPage"] = paginatedList.HasNextPage;
            TempData["hasPrevPage"] = paginatedList.HasPreviousPage;
            
            return View("Orders/Index", paginatedList);
        }
        #endregion

        #region Business Hours
        public async Task<IActionResult> EditBusinessHours()
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var businessHours = await _context.BusinessHours
                .FirstOrDefaultAsync(b => b.BusinessId == business.BusinessId);

            if (businessHours == null)
            {
                TempData["sysMessage"] = $"Error: Business hours not found.";
                return RedirectToAction("Index");
            }

            return View(businessHours);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditBusinessHours(Guid id, BusinessHours businessHours)
        {
            //Check that the accessing user is a business type account
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            if (id != businessHours.BusinessId)
            {
                //TODO Remove Debug messages
                TempData["sysMessage"] = $"Debug: Id Mismatch. Edit not performed.";
                return RedirectToAction("Index");
            }

            try
            {
                if (ModelState.IsValid)
                {
                    _context.Update(businessHours);
                    await _context.SaveChangesAsync();

                    //TODO Remove Debug messages
                    TempData["sysMessage"] = $"Debug: Business Hours Edit succeeded. {businessHours.BusinessId}";
                    return RedirectToAction("Index");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                TempData["sysMessage"] = $"Error: Business does not exist, Add Failed.";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                //TODO even more debug messages!
                TempData["sysMessage"] = $"Error: {ex.GetBaseException().Message}. Add not performed.";
                return RedirectToAction("Index");
            }
            return View(businessHours);
        }
        #endregion

        #region Sales

        [HttpGet]
        public async Task<IActionResult> ViewSales(string filter = "", int page = 1, int perPage = 5, string viewInactive = "false")
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            bool viewInactiveSales = bool.Parse(viewInactive.KSTitleCase());

            var sales = await _context.Sale
                .Where(s => s.BusinessId.Equals(business.BusinessId))
                .Where(s => s.Active == !viewInactiveSales)
                .OrderBy(s => s.SaleName)
                .ToListAsync();

            var categories = sales
                .Select(s => s.SaleCategory)
                .Distinct()
                .ToList();

            if (!string.IsNullOrWhiteSpace(filter))
            {
                TempData["saleFilter"] = filter;
                sales = sales
                    .Where(i => i.SaleName.ToLower().Contains(filter.ToLower()))
                    .ToList();
                    
                ViewData["NoItemsFoundReason"] = $"Sorry, no results found for {filter}.";
            }

            var paginatedSales = KSPaginatedList<Sale>.Create(sales.AsQueryable(), page, perPage);

            //Gather temp data and pagination/filter info
            //  all in to one place for use 
            TempData["saleCategories"] = categories;
            TempData["currentPage"] = page;
            TempData["totalPage"] = paginatedSales.TotalPages;
            TempData["perPage"] = perPage;
            TempData["hasNextPage"] = paginatedSales.HasNextPage;
            TempData["hasPrevPage"] = paginatedSales.HasPreviousPage;
            TempData["viewInactiveSales"] = viewInactiveSales;

            return View("SalesList", paginatedSales);
        }

        [HttpGet]
        public async Task<IActionResult> CreateSale()
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var blankSale = new Sale
            {
                BusinessId = business.BusinessId
            };

            var items = await _context.Item
                .Where(i => i.BusinessId.Equals(business.BusinessId))
                .ToListAsync();

            return View(blankSale);
        }

        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateSale(Guid businessId, Sale sale)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            //Ensure that the business can only add items for themselves
            if (businessId != sale.BusinessId)
            {
                _logger.LogDebug("Debug: Id Mismatch. Edit not performed.");
                return RedirectToAction("Index");
            }

            try
            {
                if (ModelState.IsValid)
                {
                    sale.SaleDiscountPercentage /= 100; //User enters discount as whole numbers(15), they are saved as decimals(0.15).
                    await _context.AddAsync(sale);
                    await _context.SaveChangesAsync();
                    _logger.LogDebug($"Debug: Sale created. {sale.BusinessId} - {sale.SaleId}");
                    return RedirectToAction("ManageSaleItem", new{ sale.SaleId});
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                _logger.LogError("Error: Business does not exist, sale creation failed.");
                return RedirectToAction("ViewSales");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error: {ex.GetBaseException().Message}. Sale creation not performed.");
                return RedirectToAction("ViewSales");
            }

            return View(sale);
        }

        [HttpGet]
        public async Task<IActionResult> ManageSaleItem(Guid saleId, string filter = "", int page = 1, int perPage = 5)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var sale = await _context.Sale
                .Where(s => s.BusinessId.Equals(business.BusinessId))
                .Where(s => s.SaleId.Equals(saleId))
                .FirstOrDefaultAsync();

            if (sale == null)
            {
                _logger.LogDebug($"Debug: Sale ID mismatch. Sale {saleId} not found for business {business.BusinessId}.");
                TempData["sysMessage"] = "Error: Something went wrong while finding your sale.";
                return RedirectToAction("ViewSales");
            }

            var items = await _context.Item
                .Where(i => i.BusinessId.Equals(business.BusinessId))
                .Where(si => si.Removed == false)
                .Include(si => si.SaleItem)
                .ToListAsync();
            
            var categories = items
                .Select(i => i.Category)
                .Distinct()
                .ToList();
            
            if (!string.IsNullOrWhiteSpace(filter))
            {
                TempData["saleFilter"] = filter;
                if (categories.Contains(filter))
                {
                    items = items
                        .Where(i => i.Category.Equals(filter))
                        .ToList();
                }
                else
                {
                    items = items
                        .Where(i => i.ItemName.ToLower().Contains(filter.ToLower()))
                        .ToList();
                }
            }
            
            var paginatedItems = KurbSideUtils.KSPaginatedList<Item>.Create(items.AsQueryable(), page, perPage);
            
            //Gather temp data and pagination/filter info
            //  all in to one place for use 
            TempData["itemCategories"] = categories;
            TempData["currentPage"] = page;
            TempData["totalPage"] = paginatedItems.TotalPages;
            TempData["perPage"] = perPage;
            TempData["hasNextPage"] = paginatedItems.HasNextPage;
            TempData["hasPrevPage"] = paginatedItems.HasPreviousPage;

            ViewData["sale"] = sale;
            return View(paginatedItems);
        }

        public enum AddOrRemove
        {
            ADD,
            REMOVE
        }

        [HttpPost]
        public async Task<IActionResult> ManageSaleItem(Guid saleId, Guid itemId, AddOrRemove addOrRemove)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var sale = await _context.Sale
                .Where(s => s.BusinessId.Equals(business.BusinessId))
                .Where(s => s.SaleId.Equals(saleId))
                .FirstOrDefaultAsync();

            var item = await _context.Item
                .Where(i => i.BusinessId.Equals(business.BusinessId))
                .Where(i => i.ItemId.Equals(itemId))
                .FirstOrDefaultAsync();

            if (sale == null)
            {
                _logger.LogDebug($"Debug: Sale ID mismatch. Sale {saleId} not found for business {business.BusinessId}.");
                TempData["sysMessage"] = "Error: Something went wrong while finding your sale.";
                return RedirectToAction("ViewSales");
            }

            if (item == null)
            {
                _logger.LogDebug($"Debug: Item ID mismatch. Sale {itemId} not found for business {business.BusinessId}.");
                TempData["sysMessage"] = "Error: Something went wrong while finding your sale.";
                return RedirectToAction("ViewSales");
            }

            try
            {
                var saleItem = await _context.SaleItem
                    .Where(s => s.SaleId.Equals(saleId))
                    .Where(i => i.ItemId.Equals(itemId))
                    .FirstOrDefaultAsync();
                
                if (addOrRemove == AddOrRemove.ADD)
                {
                    if (saleItem == null)
                    {
                        SaleItem saleItemAdd = new SaleItem
                        {
                            SaleId = saleId,
                            ItemId = itemId
                        };

                        await _context.SaleItem.AddAsync(saleItemAdd);
                        await _context.SaveChangesAsync();
                    }
                }
                else if (addOrRemove == AddOrRemove.REMOVE)
                {
                    if (saleItem != null)
                    {
                        _context.Remove(saleItem);
                        await _context.SaveChangesAsync();
                    }
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                _logger.LogError($"Error: Sale {sale.SaleId} does not exist, Update Failed.");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error: {ex.GetBaseException().Message}. Update not performed.");
                return RedirectToAction("Index");
            }

            return RedirectToAction("ManageSaleItem", new{saleId});
        }

        [HttpGet]
        public async Task<IActionResult> EditSale(Guid saleId)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var sale = await _context.Sale
                .Where(s => s.BusinessId.Equals(business.BusinessId))
                .Where(s => s.SaleId.Equals(saleId))
                .FirstOrDefaultAsync();

            if (sale == null)
            {
                _logger.LogDebug($"Debug: Sale ID mismatch. Sale {saleId} not found for business {business.BusinessId}.");
                TempData["sysMessage"] = "Error: Something went wrong while finding your sale.";
                return RedirectToAction("ViewSales");
            }
            
            sale.SaleDiscountPercentage = Math.Round(sale.SaleDiscountPercentage * 100, 2); //User enters discount as whole numbers(15), they are saved as decimals(0.15).

            return View(sale);
        }
        
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> EditSale(Guid businessId, Sale sale)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            //Ensure that the business can only add items for themselves
            if (businessId != sale.BusinessId)
            {
                _logger.LogDebug("Debug: Id Mismatch. Edit not performed.");
                return RedirectToAction("Index");
            }

            try
            {
                if (ModelState.IsValid)
                {
                    sale.SaleDiscountPercentage /= 100; //User enters discount as whole numbers(15), they are saved as decimals(0.15).
                    _context.Update(sale);
                    await _context.SaveChangesAsync();
                    return RedirectToAction("ViewSales");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                _logger.LogError($"Error: Sale {sale.SaleId} does not exist, Update Failed.");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error: {ex.GetBaseException().Message}. Update not performed.");
                return RedirectToAction("Index");
            }

            return View(sale);
        }

        [HttpPost]
        public async Task<IActionResult> SwapSaleStatus(Guid saleId)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            var sale = await _context.Sale
                .Where(s => s.BusinessId.Equals(business.BusinessId))
                .Where(s => s.SaleId.Equals(saleId))
                .FirstOrDefaultAsync();
            
            try
            {
                sale.Active = !sale.Active;
                _context.Update(sale);
                await _context.SaveChangesAsync();
                TempData["sysMessage"] = "Sale status changed successfully.";
            }
            catch (DbUpdateConcurrencyException)
            {
                _logger.LogError($"Error: Sale {sale.SaleId} does not exist, status change Failed.");
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error: {ex.GetBaseException().Message}. status change not performed.");
                return RedirectToAction("Index");
            }

            return RedirectToAction("ViewSales");
        }

        #endregion
    }
}
