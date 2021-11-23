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
        public List<Album> GetAlbumsPage(int pageIndex, int pageSize, int nation, string textSearch, string function, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr;
            if (function == "discovery")
            {
                dr = dh.StoreReaders("GetAlbumsPage", pageIndex, pageSize, nation);
            }
            else
            {
                dr = dh.StoreReaders("GetAlbumsSearch", pageIndex, pageSize, textSearch);
            }
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<Album> albums = new List<Album>();
            while (dr.Read())
            {
                Album album = new Album();
                album.AlbumID = dr["AlbumID"].ToString();
                album.AlbumName = dr["AlbumName"].ToString();
                album.Image = dr["Image"].ToString();
                album.Artist = new Artist();
                album.Artist.ArtistID = dr["ArtistID"].ToString();
                album.Artist.ArtistName = dr["ArtistName"].ToString();
                albums.Add(album);
            }
            dh.Close();
            return albums;
        }
    }
}
