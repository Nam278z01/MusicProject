using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicBus
{
    public interface IArtistBus
    {
        List<Artist> GetArtistsPage(int pageIndex, int pageSize, int nation, int genderorband, string textSearch, string function, out int totalCount);
    }
}
