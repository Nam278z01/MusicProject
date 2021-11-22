﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class AlbumBus : IAlbumBus
    {
        IAlbumDao aldao;
        public AlbumBus()
        {
            aldao = new AlbumDao();
        }
        public List<AlbumwithArtist> GetAlbumsPage(int pageIndex, int pageSize, int nation, out int totalCount)
        {
            return aldao.GetAlbumsPage(pageIndex, pageSize, nation, out totalCount);
        }
    }
}
