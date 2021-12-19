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
    public class PaymentHistoryManaController : Controller
    {
        // GET: Admin/History
        public ActionResult PaymentHistory()
        {
            return View();
        }
    }
}