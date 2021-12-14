using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public class UserDao : IUserDao
    
    {
        
        MusicEntities dtc;
        public UserDao()
        {
            dtc = new MusicEntities();
        }
        public GetUser_Result CheckUser(string accountname, string password)
        {
            List<GetUser_Result> users = dtc.GetUser(accountname, password).ToList<GetUser_Result>();
            if(users.Count > 0)
            {
                return users[0];
            }
            else
            {
                return null;
            }
        }
        public AcccountUser ReadUser()
        {
            DataHelper dh = new DataHelper();
            string sql = "select  ac.AccountName,ac.Image,ac.DateCreated,ac.DueOn , us.PersonName,us.Email,us.Gender,us.Email,us.Phone from AccountUser ac  inner join[dbo].[User] as us on ac.PersonID= us.PersonID";
            DataTable dt = dh.FillDataTable(sql);
            if (dt.Rows.Count <= 0)
            {
                return null;
            }
            else
            {
                AcccountUser cs = new AcccountUser(dt.Rows[0][0].ToString(), dt.Rows[0][1].ToString(), dt.Rows[0][2].ToString(), dt.Rows[0][3].ToString(), dt.Rows[0][4].ToString(), dt.Rows[0][5].ToString(), dt.Rows[0][6].ToString(), dt.Rows[0][7].ToString(),dt.Rows[0][8].ToString());
                return cs;
            }
        }

    }
}
