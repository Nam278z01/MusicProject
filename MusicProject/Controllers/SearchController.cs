using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        public JsonResult GetSongsSearch(int pageIndex, int pageSize, string textSearch)
        {
            ISongBus sbus = new SongBus();
            List<SongwithArtist> songs = sbus.GetSongsPage(pageIndex, pageSize, "", 1, textSearch, "search", GetUserName(), out int totalCount);
            return Json(new { songs, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetArtistsSearch(int pageIndex, int pageSize, string textSearch)
        {
            IArtistBus atbus = new ArtistBus();
            List<Artist> artists = atbus.GetArtistsPage(pageIndex, pageSize, 1, 1, textSearch, "search", out int totalCount);
            return Json(new { artists, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAlbumsSearch(int pageIndex, int pageSize, string textSearch)
        {
            IAlbumBus albus = new AlbumBus();
            List<Album> albums = albus.GetAlbumsPage(pageIndex, pageSize, 1, textSearch, "search", GetUserName(), out int totalCount);
            return Json(new { albums, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistsSearch(int pageIndex, int pageSize, string textSearch)
        {
            IPlaylistBus plbus = new PlaylistBus();
            List<PlaylistwithPerson> playlists = plbus.GetPlaylistSearch(pageIndex, pageSize, textSearch, GetUserName(), out int totalCount);
            return Json(new { playlists, totalCount }, JsonRequestBehavior.AllowGet);
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