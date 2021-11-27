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
            List<SongwithArtist> songs = sbus.Get10SongsRandomCollection(GetUserName(), song.Collections[0].CollectionID, songID);
            return Json( new { song, songs}, JsonRequestBehavior.AllowGet);
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