using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class SongBus : ISongBus
    {
        ISongDao sdao;
        public SongBus()
        {
            sdao = new SongDao();
        }
        public ListofSong GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation)
        {
            return sdao.GetSongsPage(pageIndex, pageSize, collectionID, nation);
        }
    }
}
