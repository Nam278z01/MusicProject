using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicProject.Areas.Admin.Controllers
{
    [Authorize]
    public class USERController : Controller
    {
        // GET: Admin/USER
        public ActionResult IUndex()
        {
            return View("Index");
        }
    }
}