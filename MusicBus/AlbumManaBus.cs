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
        public string AddAlbum(string jsonAlbum)
        {
            return aldao.AddAlbum(jsonAlbum);
        }

        public string EditAlbum(string jsonAlbum)
        {
            return aldao.EditAlbum(jsonAlbum);
        }
        public string DeleteAlbum(string albumID)
        {
            return aldao.DeleteAlbum(albumID);
        }
       

    }
}
