using SpaceFinder.Entity;
using SpaceFinder.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SpaceFinder.Controllers
{
    public class HomeController : Controller
    {
        private IHomeRepository _homeRepository;

        public HomeController()
        {
            _homeRepository = new HomeRepository(new SpaceFinderEntities1());
        }

        public ActionResult Index(string searchText)
        {
            var result = _homeRepository.GetCompanies(searchText);
            if (!string.IsNullOrEmpty(searchText))
            {
                ViewBag.Name = searchText;
            }
            return View(result);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}