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
        public List<SongwithArtist> GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation, string textSearch, string function, out int totalCount)
        {
            return sdao.GetSongsPage(pageIndex, pageSize, collectionID, nation, textSearch, function, out totalCount);
        }
    }
}
