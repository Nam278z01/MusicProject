using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Admin.Controllers
{
    public class SongController : Controller
    {
        SongBus sb = new SongBus();
        // GET: Admin/Song
        public ActionResult ISndex()
        {
            return View("Index");
        }
        //public ActionResult GetSong()
        //{
        //    List<Song> songList = sb.GetSongAll();
        //    return Json(songList, JsonRequestBehavior.AllowGet);
        //}
    }
}