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
    public class PlaylistAdminController : Controller
    {
        // GET: Admin/PlaylistAdmin
        PlaylistAdminBus ad = new PlaylistAdminBus();
        public ActionResult IPndex()
        {
            return View();
        }
        //public ActionResult GetPlaylistAdmin()
        //{
        //    List<PlaylistAdmin> adList = ad.GetPlaylistAdminAll();
        //    return Json(adList, JsonRequestBehavior.AllowGet);
        //}
    }
}