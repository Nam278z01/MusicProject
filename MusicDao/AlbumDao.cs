using MusicObj;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

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
        public string GetAlbumForMana()
        {
            SqlDataReader reader = dh.StoreReaders("GetAlbumForMana");
            string album = Utility.ToStringForJson(reader);
            dh.Close();
            return album;
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
            public string GetAlbumForMana_N()
        {
            SqlDataReader reader = dh.StoreReaders("GetAlbumForMana");
            string albums = Utility.ToStringForJson(reader);
            dh.Close();
            return albums;
        }
        public string GetAlbums( int nation)
        {
            SqlDataReader reader = dh.StoreReaders("GetAlbums",nation);
            string al = Utility.ToStringForJson(reader);
            dh.Close();
            return al;
        }
        //public List<Album> GetAlbums()
        //{
        //    DataTable dt = dh.FillDataTable("Select*from Album");
        //    return ToList(dt);
        //}
        //public List<Album> ToList(DataTable dt)
        //{
        //    List<Album> al = new List<Album>();
        //    foreach(DataRow dr in dt.Rows)
        //    {
        //        Album album = new Album();
        //        album.AlbumID = dr["AlbumID"].ToString();
        //        album.AlbumName = dr["AlbumName"].ToString();
        //        album.Image = dr["Image"].ToString();
        //        album.Liked = int.Parse(dr["Liked"].ToString());
        //        album.Artist = new Artist();
        //        album.Artist.ArtistID = dr["ArtistID"].ToString();
        //        album.Artist.ArtistName = dr["ArtistName"].ToString();
        //        al.Add(album);
        //    }
        //    return al;
        //}
        public string AddAlbum (Album al)
        {
            string sql = "INSERT into Album values('" + al.AlbumID + "', N'" + al.AlbumName + "',N'" + al.Description + "','" + al.Image + "',N'" + al.ArtistID+ "',N'" + al.ReleasedDate+ "')";
            return dh.ExecuteNonQuery(sql);
        }
        public string DeleteAlbum(string albumid)
        {
            string st = "delete from Album where AlbumID='"+albumid+"'";
            string s = dh.ExecuteNonQuery(st);
            dh.Close();
            return s;
        }
        public string EditAlbum(Album al)
        {
            string st = "update Album set " +
                "AlbumName='" + al.AlbumName + "'," +
                "Description='" + al.Description + "'," +
                "Image='" + al.Image + "'," +
                "ArtistID='" + al.ArtistID+ "'," +
                "ReleasedDate='" + al.ReleasedDate + "'" + " where Album='" + al.AlbumID+ "'";
            return dh.ExecuteNonQuery(st);
        }

    }
}
