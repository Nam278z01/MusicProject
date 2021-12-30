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
        IAlbumBus sbus = new AlbumBus();
        public JsonResult GetSong(string songID)
        {
            ISongBus sbus = new SongBus();
            SongwithArtist song = sbus.GetSong(songID, GetUserName());
            List<SongwithArtist> songs = sbus.Get10SongsRandomCollection(GetUserName(), song.Collections[0].CollectionID, songID);
            return Json( new { song, songs}, JsonRequestBehavior.AllowGet);
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
           
            string album = sbus.GetAlbumDetail(albumID, GetUserName());
            return Json(album, JsonRequestBehavior.AllowGet);
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
        public JsonResult GetArtistDetail(string artistID)
        {
            IArtistBus sbus = new ArtistBus();

            string artist = sbus.GetArtistDetail(artistID);
            return Json(artist, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAblums( int nation)
        {
            string alb = sbus.GetAlbums(nation);
            return Json(alb, JsonRequestBehavior.AllowGet);
            
        }
       
    }
}