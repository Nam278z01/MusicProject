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
        public List<string> GetCollectionsSongsForManaPlaylistAdmin()
        {
            return pladao.GetCollectionsSongsForManaPlaylistAdmin();
        }
        public string AddPlaylistAdmin(string jsonPlaylist)
        {
            return pladao.AddPlaylistAdmin(jsonPlaylist);
        }
        public string EditPlaylistAdmin(string jsonPlaylist)
        {
            return pladao.EditPlaylistAdmin(jsonPlaylist);
        }
        public string DeletePlaylistAdmin(string PlaylistID)
        {
            return pladao.DeletePlaylistAdmin(PlaylistID);
        }
    }
}
