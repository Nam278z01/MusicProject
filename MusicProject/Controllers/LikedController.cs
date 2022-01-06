using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Controllers
{
    public class LikedController : Controller
    {
        // GET: Liked
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult LikeSong(string songID)
        {
            ISongBus sbus = new SongBus();
            string result = sbus.LikeSong(songID, GetUserName());
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DislikeSong(string songID)
        {
            ISongBus sbus = new SongBus();
            string result = sbus.DislikeSong(songID, GetUserName());
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetLikedSong(int pageIndex, int pageSize)
        {
            ISongBus sbus = new SongBus();
            List<SongwithArtist> songs = sbus.GetLikedSong(pageIndex, pageSize, GetUserName(), out int totalCount);
            return Json(new { songs, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult LikeAlbum(string albumID)
        {
            IAlbumBus albus = new AlbumBus();
            string result = albus.LikeAlbum(albumID, GetUserName());
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DislikeAlbum(string albumID)
        {
            IAlbumBus albus = new AlbumBus();
            string result = albus.DislikeAlbum(albumID, GetUserName());
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAlbumsLiked(int pageIndex, int pageSize)
        {
            IAlbumBus albus = new AlbumBus();
            List<Album> albums = albus.GetAlbumsLiked(pageIndex, pageSize, GetUserName(), out int totalCount);
            return Json(new { albums, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistsLiked(int pageIndex, int pageSize)
        {
            IPlaylistBus plbus = new PlaylistBus();
            List<PlaylistwithPerson> playlists = plbus.GetPlaylistLiked(pageIndex, pageSize, GetUserName(), out int totalCount);
            return Json(new { playlists, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult LikePlaylist(string playlistiD, int kind)
        {
            IPlaylistBus plbus = new PlaylistBus();
            string result = plbus.LikePlaylist(playlistiD, GetUserName(), kind);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DislikePlaylist(string playlistID, int kind)
        {
            IPlaylistBus plbus = new PlaylistBus();
            string result = plbus.DislikePlaylist(playlistID, GetUserName(), kind);
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