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
    public class PlaylistUserDao : IPlaylistUserDao
    {
        DataHelper dh;
        public PlaylistUserDao()
        {
            dh = new DataHelper();
        }
        public List<PlaylistUser> GetPlaylistUsers(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetPlaylistsUser", pageIndex, pageSize, accountName);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<PlaylistUser> playlistUsers = PlaylistUsersToList(dr);
            dh.Close();
            return playlistUsers;
        }
        public PlaylistUserwithUser GetPlaylistUserwithSongs(string accountName, string playlistID)
        {
            SqlDataReader reader = dh.StoreReaders("GetPlaylistUserwithSongs", accountName, playlistID);
            PlaylistUserwithUser playlist = Utility.ToList<PlaylistUserwithUser>(reader);
            dh.Close();
            return playlist;
        }
        public List<PlaylistUserwithUser> GetPlaylistsUserBySong(string accountName)
        {
            SqlDataReader reader = dh.StoreReaders("GetPlaylistsUserBySong", accountName);
            List<PlaylistUserwithUser> playlists = Utility.ToList<List<PlaylistUserwithUser>>(reader);
            dh.Close();
            return playlists;
        }
        public List<PlaylistUser> PlaylistUsersToList(SqlDataReader dr)
        {
            List<PlaylistUser> playlistUsers = new List<PlaylistUser>();
            while (dr.Read())
            {
                PlaylistUser playlistUser = new PlaylistUser();
                playlistUser.PlaylistID = dr["PlaylistID"].ToString();
                playlistUser.PlaylistName = dr["PlaylistName"].ToString();
                playlistUser.Description = dr["Description"].ToString();
                playlistUser.DateCreated = DateTime.Parse(dr["DateCreated"].ToString());
                playlistUser.AccountName = dr["AccountName"].ToString();
                playlistUser.Image = dr["Image"].ToString();
                playlistUser.isPublic = bool.Parse(dr["isPublic"].ToString());
                playlistUsers.Add(playlistUser);
            }
            return playlistUsers;
        }
        //public void UpdateManually(DataTable dtbl)
        //{
        //    SqlDataAdapter da = new SqlDataAdapter("select * from V_BaoLuu", dh.Con);

        //    string sqlInsert = "insert into V_BaoLuu values (@MaBaoLuu, @MaDangKy, @MaThe, @TenGoi, @SoNgayBaoLuu, @NgayBaoLuu, @NgayBoBaoLuu, @PhiBaoLuu, @LyDo, @MaNguoiBL, @TrangThai)";
        //    SqlCommand cmInsert = new SqlCommand(sqlInsert, dh.Con);
        //    cmInsert.Parameters.Add("@MaBaoLuu", SqlDbType.Char, 10, "MaBaoLuu");
        //    cmInsert.Parameters.Add("@MaDangKy", SqlDbType.Char, 10, "MaDangKy");
        //    cmInsert.Parameters.Add("@MaThe", SqlDbType.Char, 10, "MaThe");
        //    cmInsert.Parameters.Add("@TenGoi", SqlDbType.NVarChar, 50, "TenGoi");
        //    cmInsert.Parameters.Add("@SoNgayBaoLuu", SqlDbType.Int, 8, "SoNgayBaoLuu");
        //    cmInsert.Parameters.Add("@NgayBaoLuu", SqlDbType.DateTime, 4, "NgayBaoLuu");
        //    cmInsert.Parameters.Add("@NgayBoBaoLuu", SqlDbType.DateTime, 4, "NgayBoBaoLuu");
        //    cmInsert.Parameters.Add("@PhiBaoLuu", SqlDbType.Decimal, 5, "PhiBaoLuu");
        //    cmInsert.Parameters.Add("@LyDo", SqlDbType.NVarChar, 200, "LyDo");
        //    cmInsert.Parameters.Add("@MaNguoiBL", SqlDbType.VarChar, 50, "MaNguoiBL");
        //    cmInsert.Parameters.Add("@TrangThai", SqlDbType.NVarChar, 20, "TrangThai");
        //    da.InsertCommand = cmInsert;

        //    string sqlUpdate = "update V_BaoLuu set MaDangKy=@MaDangKy, MaThe=@MaThe, TenGoi=@TenGoi, SoNgayBaoLuu=@SoNgayBaoLuu, NgayBaoLuu = @NgayBaoLuu, NgayBoBaoLuu = @NgayBoBaoLuu, PhiBaoLuu=@PhiBaoLuu, LyDo=@LyDo, MaNguoiBL=@MaNguoiBL, TrangThai=@TrangThai where MaBaoLuu=@MaBaoLuu";
        //    SqlCommand cmUpdate = new SqlCommand(sqlUpdate, dh.Con);
        //    cmUpdate.Parameters.Add("@MaBaoLuu", SqlDbType.Char, 10, "MaBaoLuu");
        //    cmUpdate.Parameters.Add("@MaDangKy", SqlDbType.Char, 10, "MaDangKy");
        //    cmUpdate.Parameters.Add("@MaThe", SqlDbType.Char, 10, "MaThe");
        //    cmUpdate.Parameters.Add("@TenGoi", SqlDbType.NVarChar, 50, "TenGoi");
        //    cmUpdate.Parameters.Add("@SoNgayBaoLuu", SqlDbType.Int, 8, "SoNgayBaoLuu");
        //    cmUpdate.Parameters.Add("@NgayBaoLuu", SqlDbType.DateTime, 4, "NgayBaoLuu");
        //    cmUpdate.Parameters.Add("@NgayBoBaoLuu", SqlDbType.DateTime, 4, "NgayBoBaoLuu");
        //    cmUpdate.Parameters.Add("@PhiBaoLuu", SqlDbType.Decimal, 5, "PhiBaoLuu");
        //    cmUpdate.Parameters.Add("@LyDo", SqlDbType.NVarChar, 200, "LyDo");
        //    cmUpdate.Parameters.Add("@MaNguoiBL", SqlDbType.VarChar, 50, "MaNguoiBL");
        //    cmUpdate.Parameters.Add("@TrangThai", SqlDbType.NVarChar, 20, "TrangThai");
        //    da.UpdateCommand = cmUpdate;

        //    string sqlDelete = "delete from BaoLuu where MaBaoLuu=@MaBaoLuu";
        //    SqlCommand cmDelete = new SqlCommand(sqlDelete, dh.Con);
        //    cmDelete.Parameters.Add("@MaBaoLuu", SqlDbType.Char, 10, "MaBaoLuu");
        //    da.DeleteCommand = cmDelete;

        //    da.Update(dtbl);
        //}
    }
}
