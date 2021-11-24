using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;
using Newtonsoft.Json;

namespace MusicProject.Controllers
{
    public class CollectionController : Controller
    {
        // GET: Collection
        public JsonResult GetCollections()
        {
            ICollectionBus cbus = new CollectionBus();
            List<Collection> collectionList = cbus.GetCollections();
            return Json(collectionList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetPlaylistsByCollectionsPage(int pageIndex, int pageSize, string genres, string mood, string scene, string topic)
        {
            IPlaylistAdminBus plabus = new PlaylistAdminBus();
            int totalCount;
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<PlaylistAdminwithAdmin> playlistAdmins = plabus.GetPlaylistsByCollectionsPage(pageIndex, pageSize, genres, mood, scene, topic, accountName, out totalCount);
            return Json(new {playlistAdmins, totalCount}, JsonRequestBehavior.AllowGet);
        }
    }
}