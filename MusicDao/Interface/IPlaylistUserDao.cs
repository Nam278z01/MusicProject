using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public interface IPlaylistUserDao
    {
        List<PlaylistUser> GetPlaylistUsers(int pageIndex, int pageSize, string accountName, out int totalCount);
        PlaylistUserwithUser GetPlaylistUserwithSongs(string accountName, string playlistID);
        List<PlaylistUserwithUser> GetPlaylistsUserBySong(string accountName);
    }
}
