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
    public class PlaylistAdminDao : IPlaylistAdminDao
    {
        DataHelper dh;
        public PlaylistAdminDao()
        {
            dh = new DataHelper();
        }
        //public List<PlaylistAdmin> GetPlaylistAdminByCollection(string collectionID)
        //{
        //    string sql = "select * from PlaylistAdmin p inner join PlaylistAdmin_Collection pc on p.PlaylistID=pc.PlaylistID where pc.CollectionID = @collectionID";
        //    SqlDataAdapter da = new SqlDataAdapter(sql, dh.Con);
        //    da.SelectCommand.Parameters.Add(new SqlParameter
        //    {
        //        ParameterName = "@collectionID",
        //        Value = collectionID,
        //        SqlDbType = SqlDbType.Char,
        //        Size = 10
        //    });
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    return CollectionToList(dt);
        //}
        //public List<PlaylistAdmin> CollectionToList(DataTable dt)
        //{
        //    List<PlaylistAdmin> playlistAdmins = new List<PlaylistAdmin>();
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        PlaylistAdmin playlistAdmin = new PlaylistAdmin();
        //        playlistAdmin.PlaylistID = dr["PlaylistID"].ToString();
        //        playlistAdmin.PlaylistName = dr["PlaylistName"].ToString();
        //        playlistAdmin.Description = dr["Description"].ToString();
        //        playlistAdmin.DateCreated = DateTime.Parse(dr["DateCreated"].ToString());
        //        playlistAdmin.AccountName = dr["AccountName"].ToString();
        //        playlistAdmin.Image = dr["Image"].ToString();
        //        playlistAdmin.isPublic = bool.Parse(dr["isPublic"].ToString());
        //        playlistAdmins.Add(playlistAdmin);
        //    }
        //    return playlistAdmins;
        //}
        public List<PlaylistAdminwithAdmin> GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID, out int totalCount)
        {
            totalCount = 0;
            SqlDataReader dr = dh.StoreReaders("GetPlaylistsByCollectionPage", pageIndex, pageSize, collectionID);
            while (dr.Read())
            {
                totalCount = int.Parse(dr["totalCount"].ToString());
            }
            dr.NextResult();
            List<PlaylistAdminwithAdmin> playlistAdmins = new List<PlaylistAdminwithAdmin>();
            while (dr.Read())
            {
                PlaylistAdminwithAdmin pwa = new PlaylistAdminwithAdmin();
                pwa.PlaylistAdmin.PlaylistID = dr["PlaylistID"].ToString();
                pwa.PlaylistAdmin.PlaylistName = dr["PlaylistName"].ToString();
                pwa.PlaylistAdmin.Description = dr["Description"].ToString();
                pwa.PlaylistAdmin.DateCreated = DateTime.Parse(dr["DateCreated"].ToString());
                pwa.PlaylistAdmin.AccountName = dr["AccountName"].ToString();
                pwa.PlaylistAdmin.Image = dr["Image"].ToString();
                pwa.PlaylistAdmin.isPublic = bool.Parse(dr["isPublic"].ToString());
                pwa.Admin.PersonName = dr["PersonName"].ToString();
                playlistAdmins.Add(pwa);
            }
            dh.Close();
            return playlistAdmins;
        }
    }
}
