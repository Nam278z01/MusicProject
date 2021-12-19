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
        SongBus sb = new SongBus();
        // GET: Admin/Song
        public ActionResult Song()
        {
            return View();
        }
        //public ActionResult GetSong()
        //{
        //    List<Song> songList = sb.GetSongAll();
        //    return Json(songList, JsonRequestBehavior.AllowGet);
        //}
    }
}