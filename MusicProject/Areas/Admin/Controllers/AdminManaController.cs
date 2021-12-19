using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicProject.Areas.Admin.Controllers
{
    [Authorize]
    public class AdminManaController : Controller
    {
        // GET: Admin/ADMIN
        public ActionResult Admin()
        {
            return View();
        }
    }
}