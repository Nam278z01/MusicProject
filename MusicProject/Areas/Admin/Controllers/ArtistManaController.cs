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
    public class ArtistManaController : Controller
    {
        // GET: Admin/Artist
        ArtistBus a = new ArtistBus();
        public ActionResult Artist()
        {
            return View();
        }
        public ActionResult GetArtist()
        {
            List<Artist> aList = a.GetArtistAll();
            return Json(aList, JsonRequestBehavior.AllowGet);
        }
    }
}