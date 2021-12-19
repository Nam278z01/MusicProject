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
    public class DashBoardController : Controller
    {
        // GET: Admin/Home
        // Nam !31231231
        //An123
        //Nam này!
        public ActionResult DashBoard()
        {
            return View();
        }
    }
}