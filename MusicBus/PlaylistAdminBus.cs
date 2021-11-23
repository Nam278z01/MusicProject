using System;
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
        public List<PlaylistAdminwithAdmin> GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID, out int totalCount)
        {
            return pldao.GetPlaylistAdminsPage(pageIndex, pageSize, collectionID, out totalCount);
        }
    }
}
