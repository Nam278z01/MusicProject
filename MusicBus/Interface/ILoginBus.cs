using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicBus
{
    public interface ILoginBus
    {
        GetUser_Result CheckUser(string accountname, string password);
        AcccountUser ReadUser();
    }
}
