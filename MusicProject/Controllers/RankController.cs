using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Controllers
{
    public class RankController : Controller
    {
        // GET: Rank
        public JsonResult GetRankSongsofWeek(string nation, int quantity, int week, int year)
        {
            ISongBus sbus = new SongBus();
            string songs = sbus.GetRankSongsofWeek(GetUserName(), quantity, Nation(nation), week, year);
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetRankSongsofDay(string nation, int quantity, DateTime date)
        {
            ISongBus sbus = new SongBus();
            string songs = sbus.GetRankSongsofDay(GetUserName(), quantity, Nation(nation), date);
            return Json(songs, JsonRequestBehavior.AllowGet);
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