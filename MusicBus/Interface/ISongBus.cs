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
        List<SongwithArtist> GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation, string textSearch, string function, string accountName, out int totalCount);
        List<SongwithArtist> GetTop100Songs(string accountName, string collectionID, int nation);
        List<SongwithArtist> Get10SongsRandom(string accountName);
        List<SongwithArtist> Get10SongsNewest(string accountName);
        SongwithArtist GetSong(string songID, string accountName);
        List<SongwithArtist> Get10SongsRandomCollection(string accountName, string colletionID, string songID);
    }
}
