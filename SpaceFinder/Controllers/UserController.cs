using Newtonsoft.Json;
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

        [HttpPost]
        public JsonResult Create(User model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    model.Active = true;
                    _userRepository.InsertUser(model);
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(false, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpPost]
        public JsonResult GetUserById(int id)
        {
            var result = _userRepository.GetUserById(id);
            return Json(new
            {
                result.UserId,
                result.FirstName,
                result.LastName,
                result.UserName,
                result.Email,
                result.Password,
                result.RoleId
            }, JsonRequestBehavior.AllowGet);
        }



        [HttpPost]
        public ActionResult Edit(User model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _userRepository.UpdateUser(model);
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(false, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult Delete(int id)
        {
            return View();
        }
    }
}