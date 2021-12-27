using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicBus
{
    public interface IPlaylistAdminManaBus
    {
        string GetPlaylistsForMana();
        List<string> GetCollectionsSongsForManaPlaylistAdmin();
        string AddPlaylistAdmin(string jsonPlaylist);
        string EditPlaylistAdmin(string jsonPlaylist);
        string DeletePlaylistAdmin(string PlaylistID);
    }
}
