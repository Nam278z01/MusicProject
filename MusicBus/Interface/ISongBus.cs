using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicBus
{
    public interface ISongBus
    {
        ListofSong GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation);
    }
}
