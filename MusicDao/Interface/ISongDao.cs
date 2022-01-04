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
        List<SongwithArtist> GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation, string textSearch, string function, string accountName, out int totalCount);
        List<SongwithArtist> GetTop100Songs(string accountName, string collectionID, int nation);
        List<SongwithArtist> Get10SongsRandom(string accountName);
        List<SongwithArtist> Get10SongsNewest(string accountName);
        SongwithArtist GetSong(string songID, string accountName);
        List<SongwithArtist> Get10SongsRandomCollection(string accountName, string colletionID, string songID);
        List<SongwithArtist> GetSongsByArtistPage(int pageIndex, int pageSize, string artistID, string accountName, out int totalCount);
        List<SongwithArtist> GetSongsNewAHot(int pageIndex, int pageSize, string accountName, int time, out int totalCount);
        string GetRankSongsofWeek(string accountName, int quantity, int nation, int week, int year);
        List<string> Get3RankSongsofWeek(string accountName, int quantity, int week, int year);
        string GetSongsForMana();
        List<string> GetAlbumsGenresArtistsForManaSong();
        List<SongwithArtist> GetLikedSong(int pageIndex, int pageSize, string accountName, out int totalCount);
        string AddSong(string jsonSong);
        string EditSong(string jsonSong);
        string DeleteSong(string songID);
        string LikeSong(string songID, string accountName);
        string DislikeSong(string songID, string accountName);
    }
}
