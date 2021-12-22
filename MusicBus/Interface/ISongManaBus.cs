using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicBus
{
    public interface ISongManaBus
    {
        string GetSongsForMana();
        List<string> GetAlbumsGenresArtistsForManaSong(); 
        string AddSong(string jsonSong);
        string EditSong(string jsonSong);
        string DeleteSong(string songID);
    }
}
