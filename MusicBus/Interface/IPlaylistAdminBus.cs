using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicBus
{
    public interface IPlaylistAdminBus
    {
        List<PlaylistAdmin> GetPlaylistAdminByCollection(string collectionID);
        List<PlaylistAdmin> GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID, out int totalCount);
    }
}
