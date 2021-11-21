using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class LoginBus : ILoginBus
    {
        IUserDao udao;
        public LoginBus()
        {
            udao = new UserDao();
        }
        public GetUser_Result CheckUser(string accountname, string password)
        {
            return udao.CheckUser(accountname, password);
        }
    }
}
