using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Controllers
{
    public class MyPlaylistController : Controller
    {
        // GET: MyPlaylist
        public JsonResult GetPlaylistUsers(int pageIndex, int pageSize)
        {
            IPlaylistUserBus plbus = new PlaylistUserBus();
            int totalCount;
            List<PlaylistUser> playlistUsers = plbus.GetPlaylistUsers(pageIndex, pageSize, GetUserName(), out totalCount);
            return Json(new { playlistUsers, totalCount }, JsonRequestBehavior.AllowGet);
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
