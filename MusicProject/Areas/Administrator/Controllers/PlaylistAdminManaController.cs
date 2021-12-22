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
    public class PlaylistAdminManaController : Controller
    {
        // GET: Administrator/PlaylistAdmin
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetPlaylistsForMana()
        {
            IPlaylistAdminManaBus plabus = new PlaylistAdminManaBus();
            string playlistAdmin = plabus.GetPlaylistsForMana();
            return Json(playlistAdmin, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetSongsForManaPlaylistAdmin()
        {
            IPlaylistAdminManaBus plabus = new PlaylistAdminManaBus();
            string songs = plabus.GetSongsForManaPlaylistAdmin();
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
    }
}