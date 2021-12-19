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
    public class AlbumManaController : Controller
    {
        // GET: Admin/Album
        AlbumBus ab = new AlbumBus();
        public ActionResult Album()
        {
            return View();
        }
        //public ActionResult GetAlbum()
        //{
        //    List<Album> List = ab.GetAlbumAll();
        //    return Json(List, JsonRequestBehavior.AllowGet);
        //}
    }
}