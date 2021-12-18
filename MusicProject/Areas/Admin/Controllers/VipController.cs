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
    public class VipController : Controller
    {
        // GET: Admin/Vip

        public ActionResult IVndex()
        {
            return View();

        }
        //public ActionResult GetVip()
        //{
        //    List<Song> List = sb.GetVipAll();
        //    return Json(List, JsonRequestBehavior.AllowGet);
        //}
    }
}