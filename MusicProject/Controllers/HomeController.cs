using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;

namespace MusicProject.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }   
        public JsonResult Get10SongsRandom()
        {
            ISongBus sbus = new SongBus();
            List<SongwithArtist> songs = sbus.Get10SongsRandom(GetUserName());
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10SongsNewest()
        {
            ISongBus sbus = new SongBus();
            List<SongwithArtist> songs = sbus.Get10SongsNewest(GetUserName());
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10AlbumsRandom()
        {
            IAlbumBus abus = new AlbumBus();
            List<Album> albums = abus.Get10AlbumsRandom(GetUserName());
            return Json(albums, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10PlaylistsNewest()
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            List<PlaylistAdminwithAdmin> playlists = plbus.Get10PlaylistsNewest(GetUserName());
            return Json(playlists, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10PlaylistsRandom()
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            List<PlaylistAdminwithAdmin> playlists = plbus.Get10PlaylistsRandom(GetUserName());
            return Json(playlists, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get3RankSongsofWeek(int quantity, int week, int year)
        {
            ISongBus sbus = new SongBus();
            List<string> dataJsonSong = sbus.Get3RankSongsofWeek(GetUserName(), quantity, week, year);
            return Json(new {songsVN = dataJsonSong[0], songsUSUK = dataJsonSong[1], songsAS = dataJsonSong[2] }, JsonRequestBehavior.AllowGet);
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