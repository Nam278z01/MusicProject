using System;
using System.Collections.Generic;
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
    }
}
