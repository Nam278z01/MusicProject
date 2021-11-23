using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class PlaylistBus : IPlaylistBus
    {
        IPlaylistDao pldao;
        public PlaylistBus()
        {
            pldao = new PlaylistDao();
        }
        public List<PlaylistwithPerson> GetPlaylistSearch(int pageIndex, int pageSize, string textSearch, out int totalCount)
        {
            return pldao.GetPlaylistSearch(pageIndex, pageSize, textSearch, out totalCount);
        }
    }
}
