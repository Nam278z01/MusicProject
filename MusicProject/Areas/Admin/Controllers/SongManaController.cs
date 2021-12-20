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
    public class SongManaController : Controller
    {
        // GET: Admin/Song
        public ActionResult Song()
        {
            return View();
        }
        public ActionResult GetSongsForMana(int pageIndex, int pageSize)
        {
            ISongManaBus sbus = new SongManaBus();
            string songs = sbus.GetSongsForMana(pageIndex, pageSize, out int totalCount);
            return Json(new {songs, totalCount}, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteSong(string songID)
        {
            ISongManaBus sbus = new SongManaBus();
            string songs = sbus.DeleteSong(songID);
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
    }
}