using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class PlaylistUserBus : IPlaylistUserBus
    {
        IPlaylistUserDao pldao;
        public PlaylistUserBus()
        {
            pldao = new PlaylistUserDao();
        }
        public List<PlaylistUser> GetPlaylistUsers(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            return pldao.GetPlaylistUsers(pageIndex, pageSize, accountName, out totalCount);
        }
        public PlaylistUserwithUser GetPlaylistUserwithSongs(string accountName, string playlistID)
        {
            return pldao.GetPlaylistUserwithSongs(accountName, playlistID);
        }
        public List<PlaylistUserwithUser> GetPlaylistsUserBySong(string accountName)
        {
            return pldao.GetPlaylistsUserBySong(accountName);
        }
    }
}
