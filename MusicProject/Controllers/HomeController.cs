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
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<SongwithArtist> songs = sbus.Get10SongsRandom(accountName);
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10SongsNewest()
        {
            ISongBus sbus = new SongBus();
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<SongwithArtist> songs = sbus.Get10SongsNewest(accountName);
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10AlbumsRandom()
        {
            IAlbumBus abus = new AlbumBus();
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<Album> albums = abus.Get10AlbumsRandom(accountName);
            return Json(albums, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10PlaylistsNewest()
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<PlaylistAdminwithAdmin> playlists = plbus.Get10PlaylistsNewest(accountName);
            return Json(playlists, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10PlaylistsRandom()
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<PlaylistAdminwithAdmin> playlists = plbus.Get10PlaylistsRandom(accountName);
            return Json(playlists, JsonRequestBehavior.AllowGet);
        }
    }
}