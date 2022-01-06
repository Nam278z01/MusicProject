using System;
using MusicObj;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using MusicObj;

namespace MusicDao
{
    public class AlbumDao : IAlbumDao
    {
        DataHelper dh;
        public AlbumDao()
        {
            dh = new DataHelper();
        }
        public List<Album> GetAlbumsPage(int pageIndex, int pageSize, int nation, string textSearch, string function, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr;
            if (function == "discovery")
            {
                dr = dh.StoreReaders("GetAlbumsPage", pageIndex, pageSize, nation, accountName);
            }
            else
            {
                dr = dh.StoreReaders("GetAlbumsSearch", pageIndex, pageSize, textSearch, accountName);
            }
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<Album> albums = AlbumToList(dr);
            dh.Close();
            return albums;
        }
        public List<Album> Get10AlbumsRandom(string accountName)
        {
            SqlDataReader dr = dh.StoreReaders("Get10AlbumsRandom", accountName);
            List<Album> albums = AlbumToList(dr);
            dh.Close();
            return albums;
        }
        public List<Album> GetAlbumsByArtist(int pageIndex, int pageSize, string artistID, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetAlbumsByArtist", pageIndex, pageSize, artistID, accountName);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<Album> albums = AlbumToList(dr);
            dh.Close();
            return albums;
        }
        public List<Album> GetAlbumsNewAHot(int pageIndex, int pageSize, int time, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetAlbumsNewAHot", pageIndex, pageSize, time, accountName);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<Album> albums = AlbumToList(dr);
            dh.Close();
            return albums;
        }
        public string GetAlbumDetail(string albumID, string accountName)
        {
            SqlDataReader reader = dh.StoreReaders("GetAlbumDetail", albumID, accountName);
            string album = Utility.ToStringForJson(reader);
            dh.Close();
            return album;
        }
        public string AddAlbum(string jsonAlbum)
        {
            string result = dh.ExecuteNonQueryStoreProcedure("AddAlbum", jsonAlbum);
            return result;
        }
       
        public string EditAlbum(string jsonAlbum)
        {
            string result = dh.ExecuteNonQueryStoreProcedure("EditAlbum", jsonAlbum);
            return result;
        }
        public string DeleteAlbum(string albumID)
        {
            string sql = "delete from Album where AlbumID = @albumID";
            dh.Open();
            SqlCommand cm = new SqlCommand(sql, dh.Con);
            cm.Parameters.Add(new SqlParameter
            {
                ParameterName = "@albumID",
                Value = albumID,
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
        public List<Album>GetAlbumNation_T(int nation)
        {
            string sqlselect;
            sqlselect= "select a.*,ar.ArtistName from  Album a inner join Artist  ar on a.ArtistID=ar.ArtistID  where ar.Nation = '" + nation + "'";
            DataTable dt = dh.FillDataTable(sqlselect);
            return ToList(dt);
        }
        public List<Album>ToList(DataTable dt)
        {
            List<Album> al = new List<Album>();
            foreach( DataRow dr in dt.Rows)
            {
                Album album = new Album();
                album.AlbumID = dr["AlbumID"].ToString();
                album.AlbumName = dr["AlbumName"].ToString();
                album.Description = dr["Description"].ToString();
                album.Image = dr["Image"].ToString();
                album.ArtistID = dr["ArtistID"].ToString();
                album.ReleasedDate = DateTime.Parse(dr["ReleasedDate"].ToString());
                al.Add(album);
            }
            return al;
        }
        public string GetAlbumNation(int nation, string albumID)
        {
            SqlDataReader reader = dh.StoreReaders("GetAlbumNation", nation, albumID);
            string album = Utility.ToStringForJson(reader);
            dh.Close();
            return album;
        }

        public string GetAlbumsForMana()
        {
            SqlDataReader reader = dh.StoreReaders("GetAlbumsForMana");
            string albums = Utility.ToStringForJson(reader);
            dh.Close();
            return albums;
        }
        public List<string> GetArtistSongForAlbumMana()
        {
            SqlDataReader reader = dh.StoreReaders("GetArtistSongForAlbumMana");
            List<string> dataJson = new List<string>();
            dataJson.Add(Utility.ToStringForJson(reader));
            reader.NextResult();
            dataJson.Add(Utility.ToStringForJson(reader));
            dh.Close();
            return dataJson;
        }
        public List<Album> GetAlbumsLiked(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetAlbumsLiked", pageIndex, pageSize, accountName);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<Album> albums = AlbumToList(dr);
            dh.Close();
            return albums;
        }
        public List<Album> GetAlbumsListened(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetAlbumsListened", pageIndex, pageSize, accountName);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<Album> albums = AlbumToList(dr);
            dh.Close();
            return albums;
        }
        public List<Album> AlbumToList(SqlDataReader dr)
        {
            List<Album> albums = new List<Album>();
            while (dr.Read())
            {
                Album album = new Album();
                album.AlbumID = dr["AlbumID"].ToString();
                album.AlbumName = dr["AlbumName"].ToString();
                album.Image = dr["Image"].ToString();
                album.Liked = int.Parse(dr["Liked"].ToString());
                album.Artist = new Artist();
                album.Artist.ArtistID = dr["ArtistID"].ToString();
                album.Artist.ArtistName = dr["ArtistName"].ToString();
                albums.Add(album);
            }
            return albums;
        }
        public string LikeAlbum(string albumID, string accountName)
        {
            string sql = "insert into AlbumLiked values(@accountName, @albumID, @DateLiked)";
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
                ParameterName = "@albumID",
                Value = albumID,
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
        public string DislikeAlbum(string albumID, string accountName)
        {
            string sql = "delete from AlbumLiked where AccountName = @accountName and AlbumID = @albumID";
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
                ParameterName = "@albumID",
                Value = albumID,
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
        public string AlbumListened(string albumID, string accountName)
        {
            string result = dh.ExecuteNonQueryStoreProcedure("AlbumListened", albumID, accountName);
            return result;
        }
    }
}
