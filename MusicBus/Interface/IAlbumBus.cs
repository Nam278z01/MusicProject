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
        List<AlbumwithArtist> GetAlbumsPage(int pageIndex, int pageSize, int nation, out int totalCount);
    }
}
