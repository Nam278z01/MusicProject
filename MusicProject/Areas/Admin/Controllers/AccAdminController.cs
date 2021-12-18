using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Admin.Controllers
{
    [Authorize]
    public class AccAdminController : Controller
    {
        // GET: Admin/AccAdmin
        public ActionResult IAAndex()
        {
            return View("Index");
        }
    }
}