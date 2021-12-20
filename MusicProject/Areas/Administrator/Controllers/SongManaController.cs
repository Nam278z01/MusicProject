using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicProject.Areas.Administrator.Controllers
{
    [Authorize]
    public class SongManaController : Controller
    {
        // GET: Administrator/SongMana
        public ActionResult Index()
        {
            return View();
        }
    }
}