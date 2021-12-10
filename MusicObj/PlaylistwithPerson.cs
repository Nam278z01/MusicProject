using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicObj
{
    public class PlaylistwithPerson
    {
        public string PlaylistID { get; set; }
        public string PlaylistName { get; set; }
        public string Description { get; set; }
        public DateTime DateCreated { get; set; }
        public string Image { get; set; }
        public string AccountName { get; set; }
        public Nullable<bool> isPublic { get; set; }
        public string PersonName { get; set; }
        public int KindofPlaylist { get; set; }
        public int Liked { get; set; }
    }
}
