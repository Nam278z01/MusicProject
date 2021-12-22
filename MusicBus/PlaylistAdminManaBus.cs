using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class PlaylistAdminManaBus : IPlaylistAdminManaBus
    {
        IPlaylistAdminDao pladao;
        ISongDao sdao;
        public PlaylistAdminManaBus()
        {
            pladao = new PlaylistAdminDao();
            sdao = new SongDao();
        }
        public string GetPlaylistsForMana()
        {
            return pladao.GetPlaylistsForMana();
        }
        public string GetSongsForManaPlaylistAdmin()
        {
            return sdao.GetSongsForManaPlaylistAdmin();
        }
    }
}
