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
        string GetAlbumsForMana();
        List<string> GetArtistSongForAlbumMana();
        string AddAlbum(string jsonAlbum);
        string EditAlbum(string jsonAlbum);
        string DeleteAlbum(string albumID);
       


    }
}
