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
        public ActionResult GetAlbumsForMana()
        {
            IAlbumManaBus albus = new AlbumManaBus();
            string albums = albus.GetAlbumsForMana();
            return Json(albums, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetArtistSongForAlbumMana()
        {
            IAlbumManaBus albus = new AlbumManaBus();
            List<string> data = albus.GetArtistSongForAlbumMana();
            return Json(new {artists = data[0], songs = data[1]}, JsonRequestBehavior.AllowGet);
        }
        public JsonResult AddAlbum(string jsonData)
        {
            IAlbumManaBus sbus = new AlbumManaBus();
            string result = sbus.AddAlbum(jsonData);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult EditAlbum(string jsonData)
        {
            IAlbumManaBus sbus = new AlbumManaBus();
            string result = sbus.EditAlbum(jsonData);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteAlbum(string albumID)
        {
            IAlbumManaBus sbus = new AlbumManaBus();
            string result = sbus.DeleteAlbum(albumID);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        
    }
}