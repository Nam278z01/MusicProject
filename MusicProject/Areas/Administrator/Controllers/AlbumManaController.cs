using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;
using MusicObj;
using MusicBus;
using System.IO;
using Azure.Core;

namespace MusicProject.Areas.Administrator.Controllers
{

    public class AlbumManaController : Controller
    {
        // GET: Administrator/AlbumMana
        //public ActionResult Index()
        //{
        //    return View();
        //}
        public ActionResult Index2()
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
        IAlbumManaBus abus = new AlbumManaBus();
        public ActionResult GetAlbumsForMana_N()
        {
            string album = abus.GetAlbumForMana_N();
            return Json(album, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetArtistSongForAlbumMana()
        {
            IAlbumManaBus albus = new AlbumManaBus();
            List<string> data = albus.GetArtistSongForAlbumMana();
            return Json(new { artist = data[0], song = data[1] }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetAlbumsForMana()
        {
            string album = abus.GetAlbumForMana();
            return Json(album, JsonRequestBehavior.AllowGet);
        }
        public JsonResult AddAlbum(Album al)
        {
            string st = abus.AddAlbum(al);
            return Json(st, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteAlbum(string albumid)
        {
            string st = abus.DeleteAlbum(albumid);
            return Json(st, JsonRequestBehavior.AllowGet);

        }
        public JsonResult EditAlbum(Album al)
        {
            string st = abus.EditAlbum(al);
            return Json(st, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Upload(string alid)
        {
            List<string> l = new List<string>();
            string path = Server.MapPath("~/assests/img/album" + alid + "/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            foreach (string key in Request.Files)
            {
                HttpPostedFileBase pf = Request.Files[key];
                pf.SaveAs(path + pf.FileName);
                l.Add(pf.FileName);
            }
            return Json(l, JsonRequestBehavior.AllowGet);
        }
    }
}