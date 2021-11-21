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
    }
}