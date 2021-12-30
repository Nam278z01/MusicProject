using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Administrator.Controllers
{
    
    public class SongManaController : Controller
    {
        // GET: Administrator/SongMana
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetSongsForMana()
        {
            ISongManaBus sbus = new SongManaBus();
            string songs = sbus.GetSongsForMana();
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetAlbumsGenresArtistsForManaSong()
        {
            ISongManaBus sbus = new SongManaBus();
            List<string> data = sbus.GetAlbumsGenresArtistsForManaSong();
            return Json(new {ablums = data[0], genres = data[1], artists = data[2]}, JsonRequestBehavior.AllowGet);
        }
        public JsonResult AddSong(string jsonData)
        {
            ISongManaBus sbus = new SongManaBus();
            string result = sbus.AddSong(jsonData);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult EditSong(string jsonData)
        {
            ISongManaBus sbus = new SongManaBus();
            string result = sbus.EditSong(jsonData);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteSong(string songID)
        {
            ISongManaBus sbus = new SongManaBus();
            string songs = sbus.DeleteSong(songID);
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
    }
}