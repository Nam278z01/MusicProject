using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

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
            var jsonResult = new StringBuilder();
            if (!reader.HasRows)
            {
                return new List<SongwithArtist>();
            }
            else
            {
                while (reader.Read())
                {
                    jsonResult.Append(reader.GetValue(0).ToString());
                }
            }
            List<SongwithArtist> songs = JsonConvert.DeserializeObject<List<SongwithArtist>>(jsonResult.ToString());
            dh.Close();
            return songs;
        }
        public List<SongwithArtist> GetTop100Songs(string accountName, string collectionID, int nation)
        {
            SqlDataReader reader = dh.StoreReaders("GetTop100Songs", accountName, collectionID, nation);
            var jsonResult = new StringBuilder();
            if (!reader.HasRows)
            {
                return new List<SongwithArtist>();
            }
            else
            {
                while (reader.Read())
                {
                    jsonResult.Append(reader.GetValue(0).ToString());
                }
            }
            List<SongwithArtist> songs = JsonConvert.DeserializeObject<List<SongwithArtist>>(jsonResult.ToString());
            dh.Close();
            return songs;
        }

        public List<SongwithArtist> Get10SongsRandom(string accountName)
        {
            SqlDataReader reader = dh.StoreReaders("Get10SongsRandom", accountName);
            var jsonResult = new StringBuilder();
            if (!reader.HasRows)
            {
                return new List<SongwithArtist>();
            }
            else
            {
                while (reader.Read())
                {
                    jsonResult.Append(reader.GetValue(0).ToString());
                }
            }
            List<SongwithArtist> songs = JsonConvert.DeserializeObject<List<SongwithArtist>>(jsonResult.ToString());
            dh.Close();
            return songs;
        }
        public List<SongwithArtist> Get10SongsNewest(string accountName)
        {
            SqlDataReader reader = dh.StoreReaders("Get10SongsNewest", accountName);
            var jsonResult = new StringBuilder();
            if (!reader.HasRows)
            {
                return new List<SongwithArtist>();
            }
            else
            {
                while (reader.Read())
                {
                    jsonResult.Append(reader.GetValue(0).ToString());
                }
            }
            List<SongwithArtist> songs = JsonConvert.DeserializeObject<List<SongwithArtist>>(jsonResult.ToString());
            dh.Close();
            return songs;
        }
        public SongwithArtist GetSong(string songID, string accountName)
        {
            SqlDataReader reader = dh.StoreReaders("GetSong", accountName, songID);
            var jsonResult = new StringBuilder();
            if (!reader.HasRows)
            {
                return new SongwithArtist();
            }
            else
            {
                while (reader.Read())
                {
                    jsonResult.Append(reader.GetValue(0).ToString());
                }
            }
            SongwithArtist song = JsonConvert.DeserializeObject<SongwithArtist>(jsonResult.ToString());
            dh.Close();
            return song;
        }
    }
}
