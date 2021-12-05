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
        public int Liked { get; set; }
        public int TotalLikes { get; set; }
        public int TotalSongs { get; set; }
        public List<SongwithArtist> Songs { get; set; }
        public PlaylistUserwithUser()
        {
            PlaylistUser = new PlaylistUser();
            User = new User();
            Songs = new List<SongwithArtist>();
        }
    }
}
