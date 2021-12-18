using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicProject.Areas.Admin.Controllers
{
    [Authorize]
    public class ADMINController : Controller
    {
        // GET: Admin/ADMIN
        public ActionResult IADndex()
        {
            return View("Index");
        }
    }
}