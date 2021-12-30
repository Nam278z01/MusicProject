using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Administrator.Controllers
{
 
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
        public ActionResult GetCollectionsSongsForManaPlaylistAdmin()
        {
            PlaylistAdminManaBus sbus = new PlaylistAdminManaBus();
            List<string> data = sbus.GetCollectionsSongsForManaPlaylistAdmin();
            return Json(new { collections = data[0], songs = data[1] }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult AddPlaylistAdmin(string jsonData)
        {
            PlaylistAdminManaBus sbus = new PlaylistAdminManaBus();
            string result = sbus.AddPlaylistAdmin(jsonData);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult EditPlaylistAdmin(string jsonData)
        {
            PlaylistAdminManaBus sbus = new PlaylistAdminManaBus();
            string result = sbus.EditPlaylistAdmin(jsonData);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeletePlaylistAdmin(string PlaylistID)
        {
            PlaylistAdminManaBus sbus = new PlaylistAdminManaBus();
            string playlist = sbus.DeletePlaylistAdmin(PlaylistID);
            return Json(playlist, JsonRequestBehavior.AllowGet);
        }
    }
}