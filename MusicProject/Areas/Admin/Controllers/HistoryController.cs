﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Areas.Admin.Controllers
{
    public class HistoryController : Controller
    {
        // GET: Admin/History
        public ActionResult IHndex()
        {
            return View("Index");
        }
    }
}