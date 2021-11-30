using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;

namespace MusicProject.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public JsonResult Login(string accountname, string password)
        {
            ILoginBus lgbus = new LoginBus();
            GetUser_Result user = lgbus.CheckUser(accountname, password);
            if(user == null)
            {
                Session["login"] = "0";
                Session["user"] = "";
            }
            else
            {
                user.Password = "";
                Session["login"] = "1";
                Session["user"] = user;
            }
            return Json(new { login = Session["login"], user = Session["user"] }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult CheckLogin()
        {
            return Json(new { login = Session["login"], user = Session["user"] }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Logout()
        {
            Session.Clear();
            Session["login"] = "0";
            return Json(new { login = Session["login"] }, JsonRequestBehavior.AllowGet);
        }
    }
}