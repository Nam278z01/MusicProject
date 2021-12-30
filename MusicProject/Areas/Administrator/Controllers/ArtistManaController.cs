using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Administrator.Controllers
{
   
    public class ArtistManaController : Controller
    {
        // GET: Administrator/ArtistMana
        public ActionResult Index()
        {
            return View();
        }
        IArtistManaBus sbus = new ArtistManaBus();
        public ActionResult GetArtistsForMana()
        {
            string artist = sbus.GetArtistsForMana();
            return Json(artist, JsonRequestBehavior.AllowGet);
        }
        public JsonResult AddArtist(Artist at)
        {
            string st = sbus.AddArtist(at);
            return Json(st, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteArtist(string id)
        {
            string st = sbus.DeleteArtist(id);
            return Json(st, JsonRequestBehavior.AllowGet);
        }
        public JsonResult EditArtist(Artist at)
        {
            string st = sbus.EditArtist(at);
            return Json(st, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetArtistsPage(int pageIndex, int pageSize, string artistName)
        {
            ArtistList spl = sbus.GetArtistPage(pageIndex, pageSize, artistName);
            return Json(spl, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Upload(string atid)
        {
            List<string> l = new List<string>();
            string path = Server.MapPath("~/assests/img/artist" + atid + "/");
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
