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
            ISongBus sbus = new SongBus();
            int totalCount;
            List<SongwithArtist> songs = sbus.GetSongsPage(pageIndex, pageSize, collectionID, Nation(nation), "", "discovery", GetUserName(), out totalCount);
            return Json(new { songs, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID)
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            int totalCount;
            List<PlaylistAdminwithAdmin> playlistAdmins = plbus.GetPlaylistAdminsPage(pageIndex, pageSize, collectionID, GetUserName(), out totalCount);
            return Json(new { playlistAdmins, totalCount }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetArtistsPage(int pageIndex, int pageSize, string nation, int genderorband)
        {
            IArtistBus atbus = new ArtistBus();
            int totalCount;
            List<Artist> artists = atbus.GetArtistsPage(pageIndex, pageSize, Nation(nation), genderorband, "", "discovery", out totalCount);
            return Json(new { artists, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAlbumsPage(int pageIndex, int pageSize, string nation)
        {
            IAlbumBus albus = new AlbumBus();
            int totalCount;
            List<Album> albums = albus.GetAlbumsPage(pageIndex, pageSize, Nation(nation), "", "discovery", GetUserName(), out totalCount);
            return Json(new { albums, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public int Nation(string nation)
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
            return nationInt;
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