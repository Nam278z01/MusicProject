using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;

namespace MusicProject.Controllers
{
    public class Top100Controller : Controller
    {
        // GET: Top100
        public JsonResult GetTop100Songs(string collectionID, string nation)
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
            ISongBus sbus = new SongBus();
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<SongwithArtist> songs = sbus.GetTop100Songs(accountName, collectionID, nationInt);
            return Json(songs, JsonRequestBehavior.AllowGet);
        }
    }
}