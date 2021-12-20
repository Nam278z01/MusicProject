using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicBus
{
    public interface ISongManaBus
    {
        string GetSongsForMana(int pageIndex, int pageSize, out int totalCount);
        string DeleteSong(string songID);
    }
}
