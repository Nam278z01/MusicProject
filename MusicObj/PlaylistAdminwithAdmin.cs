using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicObj
{
    public class PlaylistAdminwithAdmin
    {
        public PlaylistAdmin PlaylistAdmin { get; set; }
        public Admin Admin { get; set; }
        public int Liked { get; set; }
        public PlaylistAdminwithAdmin()
        {
            PlaylistAdmin = new PlaylistAdmin();
            Admin = new Admin();
        }
    }
}
