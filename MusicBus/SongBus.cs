using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class SongBus : ISongBus
    {
        ISongDao sdao;
        public SongBus()
        {
            sdao = new SongDao();
        }
        public List<SongwithArtist> GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation, string textSearch, string function, string accountName, out int totalCount)
        {
            return sdao.GetSongsPage(pageIndex, pageSize, collectionID, nation, textSearch, function, accountName, out totalCount);
        }
        public List<SongwithArtist> GetTop100Songs(string accountName, string collectionID, int nation)
        {
            return sdao.GetTop100Songs(accountName, collectionID, nation);
        }
        public List<SongwithArtist> Get10SongsRandom(string accountName)
        {
            return sdao.Get10SongsRandom(accountName);
        }
        public List<SongwithArtist> Get10SongsNewest(string accountName)
        {
            return sdao.Get10SongsNewest(accountName);
        }
        public SongwithArtist GetSong(string songID, string accountName)
        {
            return sdao.GetSong(songID, accountName);
        }
        public List<SongwithArtist> Get10SongsRandomCollection(string accountName, string colletionID, string songID)
        {
            return sdao.Get10SongsRandomCollection(accountName, colletionID, songID);
        }
        public List<SongwithArtist> GetSongsByArtistPage(int pageIndex, int pageSize, string artistID, string accountName, out int totalCount)
        {
            return sdao.GetSongsByArtistPage(pageIndex, pageSize, artistID, accountName, out totalCount);
        }
        public List<SongwithArtist> GetSongsNewAHot(int pageIndex, int pageSize, string accountName, int time, out int totalCount)
        {
            return sdao.GetSongsNewAHot(pageIndex, pageSize, accountName, time, out totalCount);
        }
    }
}
