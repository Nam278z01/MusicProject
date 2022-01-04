using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Controllers
{
    public class LikedController : Controller
    {
        // GET: Liked
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult LikeSong(string songID)
        {
            ISongBus sbus = new SongBus();
            string result = sbus.LikeSong(songID, GetUserName());
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DislikeSong(string songID)
        {
            ISongBus sbus = new SongBus();
            string result = sbus.DislikeSong(songID, GetUserName());
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetLikedSong(int pageIndex, int pageSize)
        {
            ISongBus sbus = new SongBus();
            List<SongwithArtist> songs = sbus.GetLikedSong(pageIndex, pageSize, GetUserName(), out int totalCount);
            return Json(new { songs, totalCount }, JsonRequestBehavior.AllowGet);
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