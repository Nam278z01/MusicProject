﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {     
            if (User.Identity.IsAuthenticated)
                return Redirect("/Administrator/DashBoard/Index");
            return View();
        }
        public JsonResult Login(string accountname, string password)
        {
            ILoginBus lgbus = new LoginBus();
            AccountAdmin admin = lgbus.CheckAccount(accountname, password);
            if (admin != null)
            {
                FormsAuthentication.SetAuthCookie(accountname, false);
            }
            return Json(admin, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return Redirect("/Administrator/Login/Index");
        }
    }
}