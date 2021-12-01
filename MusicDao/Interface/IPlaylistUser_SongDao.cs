using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicDao
{
    public interface IPlaylistUser_SongDao
    {
        string AddSongtoPlaylist(string songID, string playlistID);
    }
}
