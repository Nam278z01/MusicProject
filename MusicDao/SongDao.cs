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
            SqlDataReader dr;
            if (function == "search")
            {
                dr = dh.StoreReaders("GetSongsSearch", pageIndex, pageSize, textSearch, accountName);
            }
            else
            {
                dr = dh.StoreReaders("GetSongsByCollectionPage", pageIndex, pageSize, collectionID, nation, accountName);
            }
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<SongwithArtist> songs = SongToList(dr, 0, 0);
            dh.Close();
            return songs;
        }
        public List<SongwithArtist> GetTop100Songs(string accountName, string collectionID, int nation)
        {
            SqlDataReader dr = dh.StoreReaders("GetTop100Songs", accountName, collectionID, nation);
            List<SongwithArtist> songs = SongToList(dr, 1, 0);
            dh.Close();
            return songs;
        }

        public List<SongwithArtist> Get10SongsRandom(string accountName)
        {
            SqlDataReader dr = dh.StoreReaders("Get10SongsRandom", accountName);
            List<SongwithArtist> songs = SongToList(dr, 1, 0);
            dh.Close();
            return songs;
        }
        public List<SongwithArtist> Get10SongsNewest(string accountName)
        {
            SqlDataReader dr = dh.StoreReaders("Get10SongsNewest", accountName);
            List<SongwithArtist> songs = SongToList(dr, 1, 1);
            dh.Close();
            return songs;
        }

        public List<SongwithArtist> SongToList(SqlDataReader dr, int kind, int kind2)
        {
            List<SongwithArtist> songs = new List<SongwithArtist>();
            string songID = null;
            SongwithArtist swa;
            List<Artist> artists = new List<Artist>();
            while (dr.Read())
            {
                Song s = new Song();
                s.SongID = dr["SongID"].ToString();
                if (songID != s.SongID)
                {
                    artists = new List<Artist>();
                    swa = new SongwithArtist();
                    s.SongName = dr["SongName"].ToString();
                    s.Lyric = dr["Lyric"].ToString();
                    s.ReleaseDate = dr["ReleaseDate"].ToString() != "" ? DateTime.Parse(dr["ReleaseDate"].ToString()) : s.ReleaseDate;
                    s.Image = dr["Image"].ToString();
                    s.SongPath = dr["SongPath"].ToString();
                    s.Nation = int.Parse(dr["Nation"].ToString());
                    s.MV = dr["MV"].ToString();
                    s.isVip = bool.Parse(dr["isVip"].ToString());
                    swa.Song = s;
                    swa.Liked = int.Parse(dr["Liked"].ToString());
                    if(kind == 1)
                    {
                        swa.Views = int.Parse(dr["Views"].ToString());
                    }
                    Artist artist = new Artist();
                    artist.ArtistID = dr["ArtistID"].ToString();
                    artist.ArtistName = dr["ArtistName"].ToString();
                    if(kind2 == 1)
                    {
                        artist.Image = dr["ArtistImage"].ToString();
                    }
                    artists.Add(artist);
                    swa.Artists = artists;
                    songs.Add(swa);
                    songID = s.SongID;
                }
                else
                {
                    Artist artist = new Artist();
                    artist.ArtistID = dr["ArtistID"].ToString();
                    artist.ArtistName = dr["ArtistName"].ToString();
                    if (kind2 == 1)
                    {
                        artist.Image = dr["ArtistImage"].ToString();
                    }
                    artists.Add(artist);
                }
            }
            return songs;
        }
    }
}
