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
        public List<SongwithArtist> GetSongsNewAHot(int pageIndex, int pageSize, string accountName, int time, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader reader = dh.StoreReaders("GetSongsNewAHot", pageIndex, pageSize, accountName, time);
            while (reader.Read())
            {
                totalCount = int.Parse(reader["totalCount"].ToString());
            }
            reader.NextResult();
            List<SongwithArtist> songs = Utility.ToList<List<SongwithArtist>>(reader);
            dh.Close();
            return songs;
        }
        public string GetRankSongsofWeek(string accountName, int quantity, int nation, int week, int year)
        {
            SqlDataReader reader = dh.StoreReaders("GetRankSongsofWeek", accountName, quantity, nation, week, year);
            string song = Utility.ToStringForJson(reader);
            dh.Close();
            return song;
        }
        public List<string> Get3RankSongsofWeek(string accountName, int quantity, int week, int year)
        {
            List<string> dataJsonSong = new List<string>();
            SqlDataReader reader = dh.StoreReaders("Get3RankSongsofWeek", accountName, quantity, week, year);
            dataJsonSong.Add(Utility.ToStringForJson(reader));
            reader.NextResult();
            dataJsonSong.Add(Utility.ToStringForJson(reader));
            reader.NextResult();
            dataJsonSong.Add(Utility.ToStringForJson(reader));
            dh.Close();
            return dataJsonSong;
        }
        public string GetSongsForMana()
        {
            SqlDataReader reader = dh.StoreReaders("GetSongsForMana");
            string song = Utility.ToStringForJson(reader);
            dh.Close();
            return song;
        }
        public List<string> GetAlbumsGenresArtistsForManaSong()
        {
            List<string> dataJson = new List<string>();
            SqlDataReader reader = dh.StoreReaders("GetAlbumsGenresArtistsForManaSong");
            dataJson.Add(Utility.ToStringForJson(reader));
            reader.NextResult();
            dataJson.Add(Utility.ToStringForJson(reader));
            reader.NextResult();
            dataJson.Add(Utility.ToStringForJson(reader));
            dh.Close();
            return dataJson;
        }
        public List<SongwithArtist> GetLikedSong(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader reader = dh.StoreReaders("GetLikedSong", pageIndex, pageSize, accountName);
            while (reader.Read())
            {
                totalCount = int.Parse(reader["totalCount"].ToString());
            }
            reader.NextResult();
            List<SongwithArtist> songs = Utility.ToList<List<SongwithArtist>>(reader);
            dh.Close();
            return songs;
        }
        public string AddSong(string jsonSong)
        {
            string result = dh.ExecuteNonQueryStoreProcedure("AddSong", jsonSong);
            return result;
        }
        public string EditSong(string jsonSong)
        {
            string result = dh.ExecuteNonQueryStoreProcedure("EditSong", jsonSong);
            return result;
        }
        public string DeleteSong(string songID)
        {
            string sql = "delete from Song where SongID = @songID";
            dh.Open();
            SqlCommand cm = new SqlCommand(sql, dh.Con);
            cm.Parameters.Add(new SqlParameter
            {
                ParameterName = "@songID",
                Value = songID,
                SqlDbType = SqlDbType.VarChar,
                Size = 50
            });
            try
            {
                cm.ExecuteNonQuery();
                dh.Close();
                return "";
            }
            catch (SqlException e)
            {
                return e.Message;
            }
        }
        public string LikeSong(string songID, string accountName)
        {
            string sql = "insert into SongLiked values(@accountName, @songID, @DateLiked)";
            dh.Open();
            SqlCommand cm = new SqlCommand(sql, dh.Con);
            cm.Parameters.Add(new SqlParameter
            {
                ParameterName = "@accountName",
                Value = accountName,
                SqlDbType = SqlDbType.Char,
                Size = 30
            });
            cm.Parameters.Add(new SqlParameter
            {
                ParameterName = "@songID",
                Value = songID,
                SqlDbType = SqlDbType.VarChar,
                Size = 50
            });
            cm.Parameters.Add(new SqlParameter
            {
                ParameterName = "@DateLiked",
                Value = DateTime.Now,
                SqlDbType = SqlDbType.DateTime,
            });
            try
            {
                cm.ExecuteNonQuery();
                dh.Close();
                return "";
            }
            catch (SqlException e)
            {
                return e.Message;
            }
        }
        public string DislikeSong(string songID, string accountName)
        {
            string sql = "delete from SongLiked where AccountName = @accountName and SongID = @songID";
            dh.Open();
            SqlCommand cm = new SqlCommand(sql, dh.Con);
            cm.Parameters.Add(new SqlParameter
            {
                ParameterName = "@accountName",
                Value = accountName,
                SqlDbType = SqlDbType.Char,
                Size = 30
            });
            cm.Parameters.Add(new SqlParameter
            {
                ParameterName = "@songID",
                Value = songID,
                SqlDbType = SqlDbType.VarChar,
                Size = 50
            });
            try
            {
                cm.ExecuteNonQuery();
                dh.Close();
                return "";
            }
            catch (SqlException e)
            {
                return e.Message;
            }
        }
    }
}
