using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicProject.Areas.Admin.Controllers
{
    [Authorize]
    public class UserManaController : Controller
    {
        // GET: Admin/USER
        public ActionResult UserM()
        {
            return View();
        }
    }
}