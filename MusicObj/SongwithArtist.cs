using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace MusicObj
{
    //[JsonObject(MemberSerialization = MemberSerialization.OptIn)]
    public class SongwithArtist
    {
        //[JsonProperty(PropertyName = "Song")]
        public Song Song { get; set; }
        //[JsonProperty(PropertyName = "Liked")]
        public int Liked { get; set; }
        //[JsonProperty(PropertyName = "Views")]
        public int Views { get; set; }
        //[JsonProperty(PropertyName = "TotalLikes")]
        public int TotalLikes { get; set; }
        //[JsonProperty(PropertyName = "Collections")]
        public List<Collection> Collections { get; set; }
        //[JsonProperty(PropertyName = "Artists")]
        public List<Artist> Artists { get; set; }
        public SongwithArtist()
        {
            Song = new Song();
            Artists = new List<Artist>();
            Collections = new List<Collection>();
        }
    }
}
