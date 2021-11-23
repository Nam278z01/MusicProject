using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicBus
{
    public interface IAlbumBus
    {
        List<Album> GetAlbumsPage(int pageIndex, int pageSize, int nation, string textSearch, string function, out int totalCount);
    }
}
