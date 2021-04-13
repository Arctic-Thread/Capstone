﻿using KurbSide.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using KurbSide.Utilities;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Drawing;
using System.IO;
using Syncfusion.Pdf.Grid;

namespace KurbSide.Controllers
{
    /// <summary>
    /// Controller for Reports 
    /// </summary>
    [Authorize]
    public class ReportsController : Controller
    {
        private readonly KSContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public ReportsController(KSContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        /// <summary>
        /// Displays the report listing page.
        /// </summary>
        public async Task<IActionResult> ViewAllReportList()
        {
            //Check that the accessing user is a business type account
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
            {
                TempData["sysMessage"] = "Error: You're not signed in as a business.";
                return RedirectToAction("Index", "Home");
            }

            return View();
        }

        /// <summary>
        /// Displays the All Items Report page.
        /// </summary>
        public async Task<IActionResult> ViewAllItemsReport()
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

            //Gets all the items
            var items = await _context.Item
                .Where(b => b.BusinessId.Equals(business.BusinessId))
                .ToListAsync();

            TempData["businessId"] = business.BusinessId;
            return View(items);
        }

        /// <summary>
        /// Displays the All Removed Items Report. 
        /// </summary>
        public async Task<IActionResult> ViewRemovedItemsReport()
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

            //Gets removed items
            var items = await _context.Item
                .Where(b => b.BusinessId.Equals(business.BusinessId))
                .Where(i => i.Removed == true)
                .ToListAsync();

            TempData["businessId"] = business.BusinessId;
            return View(items);
        }

        /// <summary>
        /// Displays the All Available Items Report.
        /// </summary>
        public async Task<IActionResult> ViewAvailableItemsReport()
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

            //Get for sale items
            var items = await _context.Item
                .Where(b => b.BusinessId.Equals(business.BusinessId))
                .Where(i => i.Removed == false)
                .ToListAsync();

            TempData["businessId"] = business.BusinessId;
            return View(items);
        }

        /// <summary>
        /// Downloads a PDF version of the specified report.
        /// </summary>
        /// <param name="pdfName">The name of the report</param>
        public async Task<FileResult> CreateItemsReportsPdf(string pdfName)
        {
            //Check that the accessing user is a business type account
            var user = await KSCurrentUser.KSGetCurrentUserAsync(_userManager, HttpContext);
            var accountType = await KSCurrentUser.KSGetAccountType(_context, _userManager, HttpContext);

            //If the currently logged in user is not a business they can not access business controllers.
            if (accountType != KSCurrentUser.AccountType.BUSINESS)
                return null;

            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            string fileName = "";

            MemoryStream workStream = new MemoryStream();

            //Create a new document
            PdfDocument itemsReportDocument = new PdfDocument();

            //Adding a page to the itemsReportDocument 
            PdfPage page = itemsReportDocument.Pages.Add();

            //Pdf Graphics for the page
            PdfGraphics graphics = page.Graphics;

            //Pdf grid for the table
            PdfGrid pdfGrid = new PdfGrid();

            //Set the standard font
            PdfFont font = new PdfStandardFont(PdfFontFamily.Helvetica, 20);

            switch (pdfName)
            {
                //Downloads report for all the items
                case "AllItemsReport":
                {
                    var itemsList = await _context.Item
                        .Where(b => b.BusinessId.Equals(business.BusinessId))
                        .Select(i => new {i.ItemName, i.Price, i.Category, i.Sku, i.Upc, i.Removed})
                        .ToListAsync();

                    //Make the list to IEnumerable
                    IEnumerable<object> itemTable = itemsList;
                    //Assign to data source
                    pdfGrid.DataSource = itemTable;
                    fileName = "All Items Report";
                    break;
                }
                //DownLoads report for all the Available items 
                case "AvailableItemsReport":
                {
                    var itemsList = await _context.Item
                        .Where(b => b.BusinessId.Equals(business.BusinessId))
                        .Where(i => i.Removed == false)
                        .Select(i => new {i.ItemName, i.Price, i.Category, i.Sku, i.Upc, i.Removed})
                        .ToListAsync();

                    //Make the list to IEnumerable
                    IEnumerable<object> itemTable = itemsList;
                    //Assign to data source
                    pdfGrid.DataSource = itemTable;
                    fileName = "Available Items Report";
                    break;
                }
                //Downloads report for all the removed items
                case "RemovedItemsReport":
                {
                    var itemsList = await _context.Item
                        .Where(b => b.BusinessId.Equals(business.BusinessId))
                        .Where(i => i.Removed == true)
                        .Select(i => new {i.ItemName, i.Price, i.Category, i.Sku, i.Upc, i.Removed})
                        .ToListAsync();

                    //Make the list to IEnumerable
                    IEnumerable<object> itemTable = itemsList;
                    //Assign to data source
                    pdfGrid.DataSource = itemTable;
                    fileName = "Removed Items Report";
                    break;
                }
            }

            //Styling the grid
            pdfGrid.Style.Font = new PdfStandardFont(PdfFontFamily.Helvetica, 8);
            pdfGrid.Style.CellPadding = new PdfPaddings(4, 4, 4, 4);

            //Draw the table to a pdf page
            graphics.DrawString(fileName, font, PdfBrushes.Black, new PointF(10, 0));
            pdfGrid.Draw(page, new PointF(10, 30));

            //Saves the Pdf to the stream
            itemsReportDocument.Save(workStream);
            workStream.Position = 0;

            //close the stream
            itemsReportDocument.Close(true);

            //Content type for pdf as well as file name
            const string type = "application/pdf";

            string currentDate = DateTime.Today.ToString("d");
            fileName = $"KurbSide-{fileName}-{currentDate}.pdf";

            return File(workStream, type, fileName);
        }

        
        
        /// <summary>
        /// Allows a buiness to view all orders
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> ViewAllOrdersReport()
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
            
            //Gets the current logged in business
            var business = await _context.Business
                .Where(b => b.AspNetId.Equals(user.Id))
                .FirstOrDefaultAsync();

            TempData["businessId"] = business.BusinessId;
            
            //Gets the orders of the business
            var orders = await _context.Order
                .Include(m=> m.Member)
                .Include(s=> s.StatusNavigation)
                .OrderBy(o => o.CreationDate)
                .Where(b => b.BusinessId.Equals(business.BusinessId))
                .ToListAsync();
            
            return View(orders);
        }

    }
}