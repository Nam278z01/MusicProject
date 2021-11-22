using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicObj
{
    public class ListofSong
    {
        public List<SongwithArtist> songs { get; set; }
        public int totalCount { get; set; }
        public ListofSong()
        {
            songs = new List<SongwithArtist>();
        }
    }
}
