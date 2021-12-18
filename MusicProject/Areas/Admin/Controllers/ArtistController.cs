using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Admin.Controllers
{
    public class ArtistController : Controller
    {
        // GET: Admin/Artist
        ArtistBus a = new ArtistBus();
        public ActionResult IATndex()
        {
            return View("Index");
        }
        //public ActionResult GetArtist()
        //{
        //    List<Artist> aList = a.GetArtistAll();
        //    return Json(aList, JsonRequestBehavior.AllowGet);
        //}
    }
}