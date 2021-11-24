using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicBus
{
    public interface IPlaylistBus
    {
        List<PlaylistwithPerson> GetPlaylistSearch(int pageIndex, int pageSize, string textSearch, string accountName, out int totalCount);
    }
}
