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
    public class AdminDao : IAdminDao
    {
        DataHelper dh;
        public AdminDao()
        {
            dh = new DataHelper();
        }
        public AccountAdmin CheckAccount(string acc, string pass)
        {
            SqlDataReader reader = dh.StoreReaders("CheckAccountAM", acc, pass);
            AccountAdmin admin = Utility.ToList<AccountAdmin>(reader);
            dh.Close();
            return admin;
        }
    }
}
