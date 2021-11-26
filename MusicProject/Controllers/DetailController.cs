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
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            SongwithArtist song = sbus.GetSong(songID, accountName);
            return Json(song, JsonRequestBehavior.AllowGet);
        }
    }
}