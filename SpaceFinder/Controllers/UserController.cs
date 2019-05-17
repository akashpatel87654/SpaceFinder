using SpaceFinder.Entity;
using SpaceFinder.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SpaceFinder.Controllers
{
    public class UserController : Controller
    {
        private IUserRepository _userRepository;

        public UserController()
        {
            _userRepository = new UserRepository(new SpaceFinderEntities1());
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(User user)
        {
            return View();
        }

        public ActionResult Edit()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Edit(User user)
        {
            return View();
        }

        public ActionResult Delete(int id)
        {
            return View();
        }
    }
}