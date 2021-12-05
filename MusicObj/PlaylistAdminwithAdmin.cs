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
        public int TotalLikes { get; set; }
        public List<Collection> Collections { get; set; }
        public List<SongwithArtist> Songs { get; set; }
        public PlaylistAdminwithAdmin()
        {
            PlaylistAdmin = new PlaylistAdmin();
            Admin = new Admin();
            Songs = new List<SongwithArtist>();
            Collections = new List<Collection>();
        }
    }
}
