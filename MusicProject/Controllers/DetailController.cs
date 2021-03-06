using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;

namespace MusicProject.Controllers
{
    public class DetailController : Controller
    {
        // GET: Detail
        public JsonResult GetSong(string songID)
        {
            ISongBus sbus = new SongBus();
            SongwithArtist song = sbus.GetSong(songID, GetUserName());
            return Json(song, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Get10SongsRandomCollection(string songID, string collectionID)
        {
            ISongBus sbus = new SongBus();
            List<SongwithArtist> songs = sbus.Get10SongsRandomCollection(GetUserName(), collectionID, songID);
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistAdminwithSongs(string playlistID)
        {
            IPlaylistAdminBus plbus = new PlaylistAdminBus();
            PlaylistAdminwithAdmin playlist = plbus.GetPlaylistAdminwithSongs(GetUserName(), playlistID);
            List< PlaylistAdminwithAdmin> playlists = plbus.Get10PlaylistsRandomCollection(GetUserName(), playlist.Collections[0].CollectionID, playlistID);
            return Json( new {playlist, playlists}, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPlaylistUserwithSongs(string playlistID)
        {
            IPlaylistUserBus plbus = new PlaylistUserBus();
            string accountName = GetUserName();
            PlaylistUserwithUser playlist = plbus.GetPlaylistUserwithSongs(accountName, playlistID);
            if(accountName == playlist.PlaylistUser.AccountName)
            {
                return Json(new { access = true, playlist }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                if (playlist.PlaylistUser.isPublic)
                {
                    return Json(new { access = true, playlist }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { access = false }, JsonRequestBehavior.AllowGet);
                }
            }
        }
        public JsonResult GetAlbumDetail(string albumID)
        {
            IAlbumBus sbus = new AlbumBus();
            string album = sbus.GetAlbumDetail(albumID, GetUserName());
            return Json(album, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAlbumNation(int nation, string albumID)
        {
            IAlbumBus sbus = new AlbumBus();
            string alnation = sbus.GetAlbumNation(nation, albumID);
            return Json(alnation, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetArtistDetail(string artistID)
        {
            IArtistBus sbus = new ArtistBus();
            string artist = sbus.GetArtistDetail(artistID);
            return Json(artist, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetSongsByArtistPage(int pageIndex, int pageSize, string artistID)
        {
            ISongBus sbus = new SongBus();
            List<SongwithArtist> songs = sbus.GetSongsByArtistPage(pageIndex, pageSize, artistID, GetUserName(), out int totalCount);
            return Json(new {songs, totalCount}, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAlbumsByArtist(int pageIndex, int pageSize, string artistID)
        {
            IAlbumBus sbus = new AlbumBus();
            List<Album> albums = sbus.GetAlbumsByArtist(pageIndex, pageSize, artistID, GetUserName(), out int totalCount);
            return Json(new { albums, totalCount }, JsonRequestBehavior.AllowGet);
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
      
        public JsonResult GetAlbumNation_T(int nation)
        {
            IAlbumBus sbus = new AlbumBus();
            List<Album> al = sbus.GetAlbumNation_T(nation);
            return Json(al, JsonRequestBehavior.AllowGet);
        }
    }
}