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
    public class PlaylistDao : IPlaylistDao
    {
        DataHelper dh;
        public PlaylistDao()
        {
            dh = new DataHelper();
        }
        public List<PlaylistwithPerson> GetPlaylistSearch(int pageIndex, int pageSize, string textSearch,string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetPlaylistsSearch", pageIndex, pageSize, textSearch, accountName);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<PlaylistwithPerson> playlists = new List<PlaylistwithPerson>();
            while (dr.Read())
            {
                PlaylistwithPerson playlist = new PlaylistwithPerson();
                playlist.PlaylistID = dr["PlaylistID"].ToString();
                playlist.PlaylistName = dr["PlaylistName"].ToString();
                playlist.AccountName = dr["AccountName"].ToString();
                playlist.Image = dr["Image"].ToString();
                playlist.isPublic = bool.Parse(dr["isPublic"].ToString());
                playlist.PersonName = dr["PersonName"].ToString();
                playlist.KindofPlaylist = int.Parse(dr["KindofPlaylist"].ToString());
                playlist.Liked = int.Parse(dr["Liked"].ToString());
                playlists.Add(playlist);
            }
            dh.Close();
            return playlists;
        }
    }
}
