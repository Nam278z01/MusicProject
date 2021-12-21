using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicProject.Areas.Administrator.Controllers
{
    [Authorize]
    public class DashBoardController : Controller
    {
        // GET: Administrator/DashBoard
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult Upload(string path)
        {
            List<string> l = new List<string>();
            string mapPath = Server.MapPath(path);
            if (!System.IO.Directory.Exists(mapPath))
            {
                System.IO.Directory.CreateDirectory(mapPath);
            }
            foreach (string key in Request.Files)
            {
                HttpPostedFileBase pf = Request.Files[key];
                pf.SaveAs(mapPath + pf.FileName);
                l.Add(pf.FileName);
            }
            return Json(l, JsonRequestBehavior.AllowGet);
        }
    }
}