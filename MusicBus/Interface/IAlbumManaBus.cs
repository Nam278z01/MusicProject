using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;
namespace MusicBus
{
    public interface IAlbumManaBus
    {
        string GetAlbumForMana();
        string AddAlbum(Album al);
        string DeleteAlbum(string albumid);
        string EditAlbum(Album al);
        string GetAlbumForMana_N();
        List<string> GetArtistSongForAlbumMana();
        string GetAlbumsForMana();
        List<string> GetArtistSongForAlbumMana();
    }
}
