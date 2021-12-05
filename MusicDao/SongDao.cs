using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;
using System.Data;
using System.Data.SqlClient;

namespace MusicDao
{
    public class SongDao : ISongDao
    {
        DataHelper dh;
        public SongDao()
        {
            dh = new DataHelper();
        }
        public List<SongwithArtist> GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation, string textSearch, string function, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader reader;
            if (function == "search")
            {
                reader = dh.StoreReaders("GetSongsSearch", pageIndex, pageSize, textSearch, accountName);
            }
            else
            {
                reader = dh.StoreReaders("GetSongsByCollectionPage", pageIndex, pageSize, collectionID, nation, accountName);
            }
            while (reader.Read())
            {
                totalCount = int.Parse(reader["totalCount"].ToString());
            }
            reader.NextResult();
            List<SongwithArtist> songs = Utility.ToList<List<SongwithArtist>>(reader);
            dh.Close();
            return songs;
        }
        public List<SongwithArtist> GetTop100Songs(string accountName, string collectionID, int nation)
        {
            SqlDataReader reader = dh.StoreReaders("GetTop100Songs", accountName, collectionID, nation);
            List<SongwithArtist> songs = Utility.ToList<List<SongwithArtist>>(reader);
            dh.Close();
            return songs;
        }

        public List<SongwithArtist> Get10SongsRandom(string accountName)
        {
            SqlDataReader reader = dh.StoreReaders("Get10SongsRandom", accountName);
            List<SongwithArtist> songs = Utility.ToList<List<SongwithArtist>>(reader);
            dh.Close();
            return songs;
        }
        public List<SongwithArtist> Get10SongsNewest(string accountName)
        {
            SqlDataReader reader = dh.StoreReaders("Get10SongsNewest", accountName);
            List<SongwithArtist> songs = Utility.ToList<List<SongwithArtist>>(reader);
            dh.Close();
            return songs;
        }
        public SongwithArtist GetSong(string songID, string accountName)
        {
            SqlDataReader reader = dh.StoreReaders("GetSong", accountName, songID);
            SongwithArtist song = Utility.ToList<SongwithArtist>(reader);
            dh.Close();
            return song;
        }
        public List<SongwithArtist> Get10SongsRandomCollection(string accountName, string colletionID, string songID)
        {
            SqlDataReader reader = dh.StoreReaders("Get10SongsRandomCollection", accountName, colletionID, songID);
            List<SongwithArtist> songs = Utility.ToList<List<SongwithArtist>>(reader);
            dh.Close();
            return songs;
        }
        public List<SongwithArtist> GetSongsByArtistPage(int pageIndex, int pageSize, string artistID, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader reader = dh.StoreReaders("GetSongsByArtistPage", pageIndex, pageSize, artistID, accountName);
            while (reader.Read())
            {
                totalCount = int.Parse(reader["totalCount"].ToString());
            }
            reader.NextResult();
            List<SongwithArtist> songs = Utility.ToList<List<SongwithArtist>>(reader);
            dh.Close();
            return songs;
        }
    }
}
