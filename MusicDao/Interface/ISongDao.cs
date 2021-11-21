using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public interface ISongDao
    {
        ListofSong GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation);
    }
}
