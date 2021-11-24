﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class PlaylistAdminBus : IPlaylistAdminBus
    {
        IPlaylistAdminDao pldao;
        public PlaylistAdminBus()
        {
            pldao = new PlaylistAdminDao();
        }
        public List<PlaylistAdminwithAdmin> GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID, string accountName, out int totalCount)
        {
            return pldao.GetPlaylistAdminsPage(pageIndex, pageSize, collectionID, accountName, out totalCount);
        }
        public List<PlaylistAdminwithAdmin> GetPlaylistsByCollectionsPage(int pageIndex, int pageSize, string genre, string mood, string scene, string topic, string accountName, out int totalCount)
        {
            return pldao.GetPlaylistsByCollectionsPage(pageIndex, pageSize, genre, mood, scene, topic, accountName, out totalCount);
        }
    }
}
