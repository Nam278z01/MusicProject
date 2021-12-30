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
        IAlbumDao adao;
        public AlbumManaBus()
        {
            adao = new AlbumDao();
        }
        public string GetAlbumForMana()
        {
          return  adao.GetAlbumForMana();
        }
        public string AddAlbum(Album al)
        {
            return adao.AddAlbum(al);
        }
        public string DeleteAlbum(string albumid)
        {
            return adao.DeleteAlbum(albumid);
        }
        public string EditAlbum(Album al)
        {
            return adao.EditAlbum(al);
        }
        public string GetAlbumForMana_N()
        {
            return adao.GetAlbumForMana_N();
        }
        public List<string> GetArtistSongForAlbumMana()
        {
            return adao.GetArtistSongForAlbumMana();
        }
    }
}
