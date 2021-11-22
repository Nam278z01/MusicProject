using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;

namespace MusicProject.Controllers
{
    public class PlaylistAdminController : Controller
    {
        // GET: PlaylistAdmin
        public JsonResult GetPlaylistAdminByCollection(string CollectionID)
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            return Json(plbus.GetPlaylistAdminByCollection(CollectionID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID)
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            int totalCount;
            List<PlaylistAdmin> playlistAdmins = plbus.GetPlaylistAdminsPage(pageIndex, pageSize, collectionID, out totalCount);
            return Json(new {playlistAdmins = playlistAdmins, totalCount = totalCount}, JsonRequestBehavior.AllowGet);
        }
    }
}