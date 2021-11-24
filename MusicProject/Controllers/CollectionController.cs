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
            List<string> collection = new List<string>();
            List<string> collectionNew = new List<string>();
            collection.Add(genre);
            collection.Add(mood);
            collection.Add(scene);
            collection.Add(topic);
            foreach (var item in collection)
            {
                if(item != null)
                {
                    collectionNew.Add(item);
                }
            }
            if(collectionNew.Count == 0)
            {
                collectionNew.Add("");
                collectionNew.Add("");
                collectionNew.Add("");
                collectionNew.Add("");
            }
            else if(collectionNew.Count == 1)
            {
                collectionNew.Add("");
                collectionNew.Add("");
                collectionNew.Add("");
            }
            else if (collectionNew.Count == 2)
            {
                collectionNew.Add("");
                collectionNew.Add("");
            }
            else if (collectionNew.Count == 4)
            {
                collectionNew.Add("");
            }
            IPlaylistAdminBus plabus = new PlaylistAdminBus();
            int totalCount;
            GetUser_Result user = (GetUser_Result)Session["user"];
            string accountName = "";
            if (user != null)
            {
                accountName = user.AccountName;
            }
            List<PlaylistAdminwithAdmin> playlistAdmins = plabus.GetPlaylistsByCollectionsPage(pageIndex, pageSize, collectionNew[0], collectionNew[1], collectionNew[2], collectionNew[3], accountName, out totalCount);
            return Json(new {playlistAdmins, totalCount}, JsonRequestBehavior.AllowGet);
        }
    }
}