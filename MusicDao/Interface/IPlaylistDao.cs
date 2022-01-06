using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public interface IPlaylistDao
    {
        List<PlaylistwithPerson> GetPlaylistSearch(int pageIndex, int pageSize, string textSearch, string accountName, out int totalCount);
        List<PlaylistwithPerson> GetPlaylistLiked(int pageIndex, int pageSize, string accountName, out int totalCount);
        List<PlaylistwithPerson> GetPlaylistListened(int pageIndex, int pageSize, string accountName, out int totalCount);
        string ListenedPlaylist(string playlistID, string accountName, int kind);
        string LikePlaylist(string playlistID, string accountName, int kind);
        string DislikePlaylist(string playlistID, string accountName, int kind);
    }
}
