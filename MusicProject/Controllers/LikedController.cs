using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicProject.Controllers
{
    public class LikedController : Controller
    {
        // GET: Liked
        public ActionResult Index()
        {
            return View();
        }
    }
}