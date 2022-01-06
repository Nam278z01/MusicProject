using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class PlaylistBus : IPlaylistBus
    {
        IPlaylistDao pldao;
        public PlaylistBus()
        {
            pldao = new PlaylistDao();
        }
        public List<PlaylistwithPerson> GetPlaylistSearch(int pageIndex, int pageSize, string textSearch, string accountName, out int totalCount)
        {
            return pldao.GetPlaylistSearch(pageIndex, pageSize, textSearch, accountName, out totalCount);
        }
        public List<PlaylistwithPerson> GetPlaylistLiked(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            return pldao.GetPlaylistLiked(pageIndex, pageSize, accountName, out totalCount);
        }
        public List<PlaylistwithPerson> GetPlaylistListened(int pageIndex, int pageSize, string accountName, out int totalCount)
        {
            return pldao.GetPlaylistListened(pageIndex, pageSize, accountName, out totalCount);
        }
        public string ListenedPlaylist(string playlistID, string accountName, int kind)
        {
            return pldao.ListenedPlaylist(playlistID, accountName, kind);
        }
        public string LikePlaylist(string playlistID, string accountName, int kind)
        {
            return pldao.LikePlaylist(playlistID, accountName, kind);
        }
        public string DislikePlaylist(string playlistID, string accountName, int kind)
        {
            return pldao.DislikePlaylist(playlistID, accountName, kind);
        }
    }
}
