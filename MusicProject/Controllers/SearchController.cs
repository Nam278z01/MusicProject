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
            int totalCount;
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<SongwithArtist> songs = sbus.GetSongsPage(pageIndex, pageSize, "", 1, textSearch, "search", accountName, out totalCount);
            return Json(new { songs, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetArtistsSearch(int pageIndex, int pageSize, string textSearch)
        {
            IArtistBus atbus = new ArtistBus();
            int totalCount;
            List<Artist> artists = atbus.GetArtistsPage(pageIndex, pageSize, 1, 1, textSearch, "search", out totalCount);
            return Json(new { artists, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAlbumsSearch(int pageIndex, int pageSize, string textSearch)
        {
            IAlbumBus albus = new AlbumBus();
            int totalCount;
            List<Album> albums = albus.GetAlbumsPage(pageIndex, pageSize, 1, textSearch, "search", out totalCount);
            return Json(new { albums, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistsSearch(int pageIndex, int pageSize, string textSearch)
        {
            IPlaylistBus plbus = new PlaylistBus();
            int totalCount;
            List<PlaylistwithPerson> playlists = plbus.GetPlaylistSearch(pageIndex, pageSize, textSearch, out totalCount);
            return Json(new { playlists, totalCount }, JsonRequestBehavior.AllowGet);
        }
    }
}