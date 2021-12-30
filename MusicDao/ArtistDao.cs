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
        public List<Artist> GetArtistAll()
        {
            SqlDataReader reader = dh.StoreReaders("GetArtistAll");
            List<Artist> Artist = Utility.ToList<List<Artist>>(reader);
            dh.Close();
            return Artist;
        }
        public string GetArtistDetail(string artistID)
        {
            SqlDataReader reader = dh.StoreReaders("GetArtistDetail", artistID);
            string artist = Utility.ToStringForJson(reader);
            return artist;
        }
        public string GetArtistsForMana()
        {
            SqlDataReader reader = dh.StoreReaders("GetArtistForMana");
            string artist = Utility.ToStringForJson(reader);
            dh.Close();
            return artist;
        }
        public string AddArtist(Artist at)
        {
            string sql = "INSERT into Artist values('" + at.ArtistID + "', N'" + at.ArtistName + "',N'" + at.Description + "','" + at.Image + "',N'" + at.ImageBig + "',N'" + at.Nation + "',N'" + at.GenderorisBand  + "')";
            return dh.ExecuteNonQuery(sql);
        }
        public string DeleteArtist(string id)
        {
            string st = "delete from Artist where ArtistID='" + id + "'";
            string s = dh.ExecuteNonQuery(st);
            dh.Open();
            return s;
        }
        public string EditArtist(Artist al)
        {
            string st = "update Artist set " +
                "ArtistName='" + al.ArtistName + "'," +
                "Description='" + al.Description + "'," +
                "Image='" + al.Image + "'," +
                "ImageBig='" + al.ImageBig + "'," +
                "Nation='" + al.Nation + "'," +
                "GenderorisBand='" + al.GenderorisBand + "'" + " where Artist='" + al.ArtistID + "'";
            return dh.ExecuteNonQuery(st);
        }
        public ArtistList GetArtistPage(int pageIndex, int pageSize, string ArtistName)
        {
            ArtistList spl = new ArtistList();
            List<Artist> l = new List<Artist>();
            SqlDataReader dr = dh.StoreReaders("GetArtistPage", pageIndex, pageSize, ArtistName);
            while (dr.Read()) //Lấy về các sản phẩm của trang.
            {
                Artist artist = new Artist();
                artist.ArtistID = dr["ArtistID"].ToString();
                artist.ArtistName = dr["ArtistName"].ToString();
                artist.Description = dr["Description"].ToString();
                artist.Image = dr["Image"].ToString();
                artist.ImageBig = dr["ImageBig"].ToString();
                artist.Nation =byte.Parse( dr["Nation"].ToString());
                artist.GenderorisBand = byte.Parse(dr["GenderorisBand"].ToString());

                l.Add(artist);
            }
            spl.Artists = l;
            dr.NextResult();
            while (dr.Read())
                spl.totalCount = dr["totalCount"].ToString();
            return spl;
        }

    }
}
