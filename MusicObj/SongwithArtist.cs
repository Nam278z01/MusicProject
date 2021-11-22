using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicObj
{
    public class SongwithArtist
    {
        public Song Song { get; set; }
        public List<Artist> Artists { get; set; }
        public SongwithArtist()
        {
            Song = new Song();
            Artists = new List<Artist>();
        }
    }
}
