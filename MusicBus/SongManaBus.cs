using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;


namespace MusicBus
{
    public class SongManaBus : ISongManaBus
    {
        ISongDao sdao;
        public SongManaBus()
        {
            sdao = new SongDao();
        }
        public string GetSongsForMana(int pageIndex, int pageSize, out int totalCount)
        {
            return sdao.GetSongsForMana(pageIndex, pageSize, out totalCount);
        }
        public string DeleteSong(string songID)
        {
            return sdao.DeleteSong(songID);
        }
    }
}
