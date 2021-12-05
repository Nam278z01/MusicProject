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
    public class ArtistDao : IArtistDao
    {
        DataHelper dh;
        public ArtistDao()
        {
            dh = new DataHelper();
        }
        public List<Artist> GetArtistsPage(int pageIndex, int pageSize, int nation, int genderorband, string textSearch, string function, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr;
            if (function == "discovery")
            {
                dr = dh.StoreReaders("GetArtistsPage", pageIndex, pageSize, nation, genderorband);
            }
            else
            {
                dr = dh.StoreReaders("GetArtistsSearch", pageIndex, pageSize, textSearch);
            }
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<Artist> artists = new List<Artist>();
            while (dr.Read())
            {
                Artist artist = new Artist();
                artist.ArtistID = dr["ArtistID"].ToString();
                artist.ArtistName = dr["ArtistName"].ToString();
                artist.Image = dr["Image"].ToString();
                artists.Add(artist);
            }
            dh.Close();
            return artists;
        }
        public List<Artist> GetArtistsHot(int pageIndex, int pageSize, int time, int genderorband, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetArtistsHot", pageIndex, pageSize, time, genderorband);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<Artist> artists = new List<Artist>();
            while (dr.Read())
            {
                Artist artist = new Artist();
                artist.ArtistID = dr["ArtistID"].ToString();
                artist.ArtistName = dr["ArtistName"].ToString();
                artist.Image = dr["Image"].ToString();
                artists.Add(artist);
            }
            dh.Close();
            return artists;
        }
    }
}
