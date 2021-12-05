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
    public class AlbumDao : IAlbumDao
    {
        DataHelper dh;
        public AlbumDao()
        {
            dh = new DataHelper();
        }
        public List<Album> GetAlbumsPage(int pageIndex, int pageSize, int nation, string textSearch, string function,string accountName, out int totalCount)
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
    }
}
