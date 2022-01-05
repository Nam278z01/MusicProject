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
            List<PlaylistwithPerson> playlists = ToList(dr);
            dh.Close();
            return playlists;
        }
        public List<PlaylistwithPerson> GetPlaylistLiked(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetPlaylistLiked", pageIndex, pageSize, accountName);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<PlaylistwithPerson> playlists = ToList(dr);
            dh.Close();
            return playlists;
        }
        public List<PlaylistwithPerson> GetPlaylistListened(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetPlaylistListened", pageIndex, pageSize, accountName);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<PlaylistwithPerson> playlists = ToList(dr);
            dh.Close();
            return playlists;
        }
        public List<PlaylistwithPerson> ToList(SqlDataReader dr)
        {
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
            return playlists;
        }
        public string LikePlaylist(string playlistID, string accountName, int kind)
        {
            string sql;
            if(kind == 1)
            {
                sql = "insert into PlaylistAdminLiked values(@accountName, @playlistID, @DateLiked)";
            } 
            else
            {
                sql = "insert into PlaylistUserLiked values(@accountName, @playlistID, @DateLiked)";
            }
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
                ParameterName = "@playlistID",
                Value = playlistID,
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
        public string DislikePlaylist(string playlistID, string accountName, int kind)
        {
            string sql;
            if (kind == 1)
            {
                sql = "delete from PlaylistAdminLiked where AccountName = @accountName and PlaylistID = @playlistID";
            }
            else
            {
                sql = "delete from PlaylistUserLiked where AccountName = @accountName and PlaylistID = @playlistID";
            }
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
                ParameterName = "@playlistID",
                Value = playlistID,
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
        public string ListenedPlaylist(string playlistID, string accountName, int kind)
        {
            string result = dh.ExecuteNonQueryStoreProcedure("ListenedPlaylist", playlistID, accountName, kind);
            return result;
        }
    }
}
