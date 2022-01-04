﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MusicBus;
using MusicObj;

namespace MusicProject.Controllers
{
    public class ListenedController : Controller
    {
        // GET: Listened
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult SongListened(string songID)
        {
            ISongBus sbus = new SongBus();
            string result = sbus.SongListened(songID, GetUserName());
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetListenedSong(int pageIndex, int pageSize)
        {
            ISongBus sbus = new SongBus();
            List<SongwithArtist> songs = sbus.GetListenedSong(pageIndex, pageSize, GetUserName(), out int totalCount);
            return Json(new { songs, totalCount }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult IncreaseViews(string songID)
        {
            ISongBus sbus = new SongBus();
            string result = sbus.IncreaseViews(songID);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAlbumsListened(int pageIndex, int pageSize)
        {
            IAlbumBus albus = new AlbumBus();
            List<Album> albums = albus.GetAlbumsListened(pageIndex, pageSize, GetUserName(), out int totalCount);
            return Json(new { albums, totalCount }, JsonRequestBehavior.AllowGet);
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