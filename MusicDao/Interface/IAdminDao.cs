using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public interface IAdminDao
    {
        CheckAccountAM_Result CheckAccount(string acc, string pass);
    }
}
