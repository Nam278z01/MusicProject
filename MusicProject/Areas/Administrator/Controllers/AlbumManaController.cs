using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Administrator.Controllers
{
    [Authorize]
    public class AlbumManaController : Controller
    {
        // GET: Administrator/AlbumMana
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetAlbumForMana()
        {
            IAlbumManaBus albus = new AlbumManaBus();
            string albums = albus.GetAlbumForMana();
            return Json(albums, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetArtistSongForAlbumMana()
        {

            IAlbumManaBus albus = new AlbumManaBus();
            List<string> data = albus.GetArtistSongForAlbumMana();
            return Json(new { artists = data[0], songs = data[1] }, JsonRequestBehavior.AllowGet);
        }
    }
}