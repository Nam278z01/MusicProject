using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Admin.Controllers
{
    [Authorize]
    public class CollectionManaController : Controller
    {
        // GET: Admin/CollectionAD
        CollectionBus cb = new CollectionBus();
        public ActionResult Colletion()
        {
            return View();
        }
        //public ActionResult GetCollection()
        //{
        //    List<Collection> ClList = cb.GetCollectionAll();
        //    return Json(ClList, JsonRequestBehavior.AllowGet);
        //}

    }
}