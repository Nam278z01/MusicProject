using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace MusicDao
{
    public class PlaylistUser_SongDao : IPlaylistUser_SongDao
    {
        DataHelper dh;
        public PlaylistUser_SongDao()
        {
            dh = new DataHelper();
        }
        public string AddSongtoPlaylist(string songID, string playlistID)
        {
            string sql = "insert into PlaylistUser_Song values (@playlistID, @songID, getdate())";
            dh.Open();
            SqlCommand cm = new SqlCommand(sql, dh.Con);
            cm.Parameters.Add(new SqlParameter
            {
                ParameterName = "@songID",
                Value = songID,
                SqlDbType = SqlDbType.VarChar,
                Size = 50
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
    }
}
