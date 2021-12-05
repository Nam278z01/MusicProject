using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public interface IPlaylistAdminDao
    {
        List<PlaylistAdminwithAdmin> GetPlaylistAdminsPage(int pageIndex, int pageSize, string collectionID, string accountName, out int totalCount);
        List<PlaylistAdminwithAdmin> GetPlaylistsByCollectionsPage(int pageIndex, int pageSize, string genre, string mood, string scene, string topic, string accountName, out int totalCount);
        List<PlaylistAdminwithAdmin> Get10PlaylistsNewest(string accountName);
        List<PlaylistAdminwithAdmin> Get10PlaylistsRandom(string accountName);
        PlaylistAdminwithAdmin GetPlaylistAdminwithSongs(string accountName, string playlistID);
        List<PlaylistAdminwithAdmin> Get10PlaylistsRandomCollection(string accountName, string collectionID, string playlistID);
    }
}
