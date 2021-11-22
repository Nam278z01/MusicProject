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
            ListofSong songs = sbus.GetSongsPage(pageIndex, pageSize, "", 1, textSearch, "search");
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetArtistsSearch(int pageIndex, int pageSize, string textSearch)
        {
            IArtistBus atbus = new ArtistBus();
            int totalCount;
            List<Artist> artists = atbus.GetArtistsPage(pageIndex, pageSize, 1, 1, textSearch, "search", out totalCount);
            return Json(new { artists, totalCount = totalCount }, JsonRequestBehavior.AllowGet);
        }
    }
}