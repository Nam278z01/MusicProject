using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicObj
{
    public class AlbumwithArtist
    {
        public Album Album { get; set; }
        public Artist Artist { get; set; }

        public AlbumwithArtist()
        {
            Album = new Album();
            Artist = new Artist();
        }
    }
}
