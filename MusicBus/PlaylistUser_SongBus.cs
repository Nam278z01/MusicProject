using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;

namespace MusicBus
{
    public class PlaylistUser_SongBus : IPlaylistUser_SongBus
    {
        PlaylistUser_SongDao plusdao;
        public PlaylistUser_SongBus()
        {
            plusdao = new PlaylistUser_SongDao();
        }
        public string AddSongtoPlaylist(string songID, string playlistID)
        {
            return plusdao.AddSongtoPlaylist(songID, playlistID);
        }
    }
}
