using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Controllers
{
    public class MyPlaylistController : Controller
    {
        // GET: MyPlaylist
        public JsonResult GetPlaylistUsers(int pageIndex, int pageSize)
        {
            IPlaylistUserBus plbus = new PlaylistUserBus();
            List<PlaylistUser> playlistUsers = plbus.GetPlaylistUsers(pageIndex, pageSize, GetUserName(), out int totalCount);
            return Json(new { playlistUsers, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistsUserBySong()
        {
            IPlaylistUserBus plbus = new PlaylistUserBus();
            List<PlaylistUserwithUser> playlists = plbus.GetPlaylistsUserBySong(GetUserName());
            return Json(playlists, JsonRequestBehavior.AllowGet);
        }
        public JsonResult AddSongtoPlaylist(string songID, string playlistID)
        {
            IPlaylistUser_SongBus plusbus = new PlaylistUser_SongBus();
            string result = plusbus.AddSongtoPlaylist(songID, playlistID);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public string GetUserName()
        {
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            return accountName;
        }
    }
}
