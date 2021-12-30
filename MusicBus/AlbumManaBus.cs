using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class AlbumManaBus : IAlbumManaBus
    {
        IAlbumDao aldao;
        public AlbumManaBus()
        {
            aldao = new AlbumDao();
        }
        public string GetAlbumsForMana()
        {
            return aldao.GetAlbumsForMana();
        }
        public List<string> GetArtistSongForAlbumMana()
        {
            return aldao.GetArtistSongForAlbumMana();
        }
    }
}
