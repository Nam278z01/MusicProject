using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;
namespace MusicBus
{
    public interface IArtistManaBus
    {
        string GetArtistsForMana();
        //ArtistList GetArtistsPage(int pageIndex, int pageSize, string artistName);
        string AddArtist(Artist at);
        string DeleteArtist(string id);
        string EditArtist(Artist al);
        ArtistList GetArtistPage(int pageIndex, int pageSize, string ArtistName);
    }
}
