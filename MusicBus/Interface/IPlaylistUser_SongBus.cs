using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicBus
{
    public interface IPlaylistUser_SongBus
    {
        string AddSongtoPlaylist(string songID, string playlistID);
    }
}
