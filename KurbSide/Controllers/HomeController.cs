﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using KurbSide.Models;
using Microsoft.AspNetCore.Identity;
using Geocoding;
using Geocoding.Google;
using System.Net;
using System.Xml.Linq;

namespace KurbSide.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly KSContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public HomeController(ILogger<HomeController> logger, KSContext context, UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {
            var user = await GetCurrentUserAsync();
            var accountType = GetAccountType(user);
            if (accountType == "business")
            {
                return RedirectToAction("Index", "Business");
            }
            else if (accountType == "member")
            {
                //TODO Display member "home page", the store maybe? 
                //return RedirectToAction("Index", "Member");
            }
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public async Task<IActionResult> PayPalTestAsync(string address1 = "108 University Ave, Waterloo, ON Canada N2J 2W2", string address2 = "299 Doon Valley Dr, Kitchener, ON Canada N2G 4M4")
        {

            {
                Service.GeoCode geoCode = new Service.GeoCode();

                Service.Location location1 = await geoCode.GetLocationAsync(address1);
                Service.Location location2 = await geoCode.GetLocationAsync(address2);

                double distance = geoCode.CalculateDistance(location1, location2);

                TempData["ln1"] = $"{location1.address}, {location2.address}";
                TempData["ln2"] = $"{distance}";

            }

            return View("PayPalTest/PayPalTest");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        #region CurrentUserUtils
        //Current User Utils 1.0
        public Task<IdentityUser> GetCurrentUserAsync() => _userManager.GetUserAsync(HttpContext.User);

        public async Task<string> GetLoggedInEmailAsync()
        {
            var user = await GetCurrentUserAsync();
            return user == null ? "" : user.Email;
        }

        public string GetAccountType(IdentityUser? IUser)
        {
            if (IUser == null) return "";

            bool hasBusiness = _context.Business.Where(b => b.AspNetId.Equals(IUser.Id)).Count() > 0;
            bool hasMember = _context.Member.Where(b => b.AspNetId.Equals(IUser.Id)).Count() > 0;

            /*
             * HACK maybe make this an enum rather than a string to prevent future issues
             *      actually nevermind because C# enums aren't like Java enums
             *      for now keeping it standard to lowercase strings works :)
             */
            if (hasBusiness) return "business";
            else if (hasMember) return "member";
            else return "";
        }
        //End Current User Utils 1.0
        #endregion
    }
}
