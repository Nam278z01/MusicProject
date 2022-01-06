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
        MusicEntities dtc;
        public AdminDao()
        {
            dtc = new MusicEntities();
        }
        public CheckAccountAM_Result CheckAccount(string acc, string pass)
        {
            List<CheckAccountAM_Result> admin = dtc.CheckAccountAM(acc, pass).ToList<CheckAccountAM_Result>();
            if (admin.Count > 0)
            {
                return admin[0];
            }
            else
            {
                return null;
            }
        }
    }
}
