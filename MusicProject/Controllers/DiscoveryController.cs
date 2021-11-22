using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;

namespace MusicProject.Controllers
{
    public class DiscoveryController : Controller
    {
        // GET: Discovery
        public JsonResult GetSongsPage(int pageIndex, int pageSize, string collectionID, string nation)
        {
            int nationInt;
            if(nation == "vn")
            {
                nationInt = 1;
            } 
            else if(nation == "usuk")
            {
                nationInt = 2;
            }
            else if(nation == "ca")
            {
                nationInt = 3;
            }
            else
            {
                nationInt = 4;
            }
            ISongBus sbus = new SongBus();
            ListofSong songs = sbus.GetSongsPage(pageIndex, pageSize, collectionID, nationInt, "", "discovery");
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID)
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            int totalCount;
            List<PlaylistAdmin> playlistAdmins = plbus.GetPlaylistAdminsPage(pageIndex, pageSize, collectionID, out totalCount);
            return Json(new { playlistAdmins, totalCount = totalCount }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetArtistsPage(int pageIndex, int pageSize, string nation, int genderorband)
        {
            int nationInt;
            if (nation == "vn")
            {
                nationInt = 1;
            }
            else if (nation == "usuk")
            {
                nationInt = 2;
            }
            else if (nation == "ca")
            {
                nationInt = 3;
            }
            else
            {
                nationInt = 4;
            }
            IArtistBus atbus = new ArtistBus();
            int totalCount;
            List<Artist> artists = atbus.GetArtistsPage(pageIndex, pageSize, nationInt, genderorband, "", "discovery", out totalCount);
            return Json(new { artists, totalCount = totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAlbumsPage(int pageIndex, int pageSize, string nation)
        {
            int nationInt;
            if (nation == "vn")
            {
                nationInt = 1;
            }
            else if (nation == "usuk")
            {
                nationInt = 2;
            }
            else if (nation == "ca")
            {
                nationInt = 3;
            }
            else
            {
                nationInt = 4;
            }
            IAlbumBus albus = new AlbumBus();
            int totalCount;
            List<AlbumwithArtist> albums = albus.GetAlbumsPage(pageIndex, pageSize, nationInt, out totalCount);
            return Json(new { albums, totalCount = totalCount }, JsonRequestBehavior.AllowGet);
        }
    }
}