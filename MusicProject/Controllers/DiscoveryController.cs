using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicObj;
using MusicBus;

namespace MusicProject.Controllers
{
    public class DiscoveryController : Controller
    {
        // GET: Discovery
        public JsonResult GetSongsPage(int pageIndex, int pageSize, string collectionID, string nation)
        {
            int nationInt;
            if(nation == "vn")
            {
                nationInt = 1;
            } 
            else if(nation == "usuk")
            {
                nationInt = 2;
            }
            else if(nation == "ca")
            {
                nationInt = 3;
            }
            else
            {
                nationInt = 4;
            }
            ISongBus sbus = new SongBus();
            return Json(sbus.GetSongsPage(pageIndex, pageSize, collectionID, nationInt), JsonRequestBehavior.AllowGet);
        }
    }
}