using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;
using Newtonsoft.Json;

namespace MusicProject.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult ReadUser()
        {
            LoginBus lb = new LoginBus();
            AcccountUser u = lb.ReadUser();
            string l = "0";
            if (Session["login"] != null)
            {
                l = Session["login"].ToString();
            }
            string p = "";
            if (l == "1")
            {
                Session["user"] = JsonConvert.SerializeObject(u);
            }
            return Json(new { login = 1, user = u }, JsonRequestBehavior.AllowGet);
           
        }

    }
}