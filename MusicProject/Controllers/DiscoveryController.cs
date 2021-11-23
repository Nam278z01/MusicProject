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
            int totalCount;
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if(user != null)
            {
                accountName = user.AccountName;
            }
            List<SongwithArtist> songs = sbus.GetSongsPage(pageIndex, pageSize, collectionID, nationInt, "", "discovery", accountName, out totalCount);
            return Json(new { songs, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID)
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            int totalCount;
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<PlaylistAdminwithAdmin> playlistAdmins = plbus.GetPlaylistAdminsPage(pageIndex, pageSize, collectionID, accountName, out totalCount);
            return Json(new { playlistAdmins, totalCount }, JsonRequestBehavior.AllowGet);
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
            return Json(new { artists, totalCount }, JsonRequestBehavior.AllowGet);
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
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<Album> albums = albus.GetAlbumsPage(pageIndex, pageSize, nationInt, "", "discovery", accountName, out totalCount);
            return Json(new { albums, totalCount }, JsonRequestBehavior.AllowGet);
        }
    }
}