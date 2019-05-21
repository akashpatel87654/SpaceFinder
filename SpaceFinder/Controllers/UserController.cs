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
            var result = _userRepository.GetUsers();
            return View(result);
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