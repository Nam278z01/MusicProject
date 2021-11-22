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
        public List<AlbumwithArtist> GetAlbumsPage(int pageIndex, int pageSize, int nation, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetAlbumsPage", pageIndex, pageSize, nation);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<AlbumwithArtist> albums = new List<AlbumwithArtist>();
            while (dr.Read())
            {
                AlbumwithArtist album = new AlbumwithArtist();
                album.Album.AlbumID = dr["AlbumID"].ToString();
                album.Album.AlbumName = dr["AlbumName"].ToString();
                album.Album.Image = dr["Image"].ToString();
                album.Artist.ArtistID = dr["ArtistID"].ToString();
                album.Artist.ArtistName = dr["ArtistName"].ToString();
                albums.Add(album);
            }
            dh.Close();
            return albums;
        }
    }
}
