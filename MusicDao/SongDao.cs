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
        public ListofSong GetSongsPage(int pageIndex, int pageSize, string collectionID, int nation)
        {
            ListofSong los = new ListofSong();
            SqlDataReader dr = dh.StoreReaders("GetSongsByCollectionPage", pageIndex, pageSize, collectionID, nation);
            //Start: Lấy bài hát cùng các nghệ sĩ
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
                    s.isVip = bool.Parse(dr["isVip"].ToString());
                    swa.Song = s;
                    Artist artist = new Artist();
                    artist.ArtistID = dr["ArtistID"].ToString();
                    artist.ArtistName = dr["ArtistName"].ToString();
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
                    artists.Add(artist);
                }
            }
            los.songs = songs;
            //End: Lấy bài hát cùng các nghệ sĩ
            dr.NextResult();
            while (dr.Read())
            {
                los.totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dh.Close();
            return los;
        }
    }
}
