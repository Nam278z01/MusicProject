using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public interface IPlaylistDao
    {
        List<PlaylistwithPerson> GetPlaylistSearch(int pageIndex, int pageSize, string textSearch, string accountName, out int totalCount);
    }
}
