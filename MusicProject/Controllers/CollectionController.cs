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

        public JsonResult GetPlaylistsByCollectionsPage(int pageIndex, int pageSize, string genre, string mood, string scene, string topic)
        {
            List<string> collection = new List<string>() { genre, mood, scene, topic };
            List<string> collectionNew = new List<string>();
            foreach (var item in collection)
            {
                if(item != null)
                {
                    collectionNew.Add(item);
                }
            }
            int length = collection.Count - collectionNew.Count;
            for (int i = 0; i < length; i++)
            {
                collectionNew.Add("");
            }
            IPlaylistAdminBus plabus = new PlaylistAdminBus();
            int totalCount;
            List<PlaylistAdminwithAdmin> playlistAdmins = plabus.GetPlaylistsByCollectionsPage(pageIndex, pageSize, collectionNew[0], collectionNew[1], collectionNew[2], collectionNew[3], GetUserName(), out totalCount);
            return Json(new {playlistAdmins, totalCount}, JsonRequestBehavior.AllowGet);
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