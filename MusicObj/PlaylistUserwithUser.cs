using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicObj
{
    public class PlaylistUserwithUser
    {
        public PlaylistUser PlaylistUser { get; set; }
        public User User { get; set; }
        public PlaylistUserwithUser()
        {
            PlaylistUser = new PlaylistUser();
            User = new User();
        }
    }
}
