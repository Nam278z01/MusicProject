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
        List<SongwithArtist> GetSongsByArtistPage(int pageIndex, int pageSize, string artistID, string accountName, out int totalCount);
        List<SongwithArtist> GetSongsNewAHot(int pageIndex, int pageSize, string accountName, int time, out int totalCount);
        string GetRankSongsofWeek(string accountName, int quantity, int nation, int week, int year);
        string GetRankSongsofDay(string accountName, int quantity, int nation, DateTime date);
        List<string> Get3RankSongsofWeek(string accountName, int quantity, int week, int year);
        List<SongwithArtist> GetLikedSong(int pageIndex, int pageSize, string accountName, out int totalCount);
        List<SongwithArtist> GetListenedSong(int pageIndex, int pageSize, string accountName, out int totalCount);
        string LikeSong(string songID, string accountName);
        string DislikeSong(string songID, string accountName);
        string SongListened(string songID, string accountName);
        string IncreaseViews(string songID);
    }
}
