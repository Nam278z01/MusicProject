using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public interface IAlbumDao
    {
        List<Album> GetAlbumsPage(int pageIndex, int pageSize, int nation, string textSearch, string function, string accountName, out int totalCount);
        List<Album> Get10AlbumsRandom(string accountName);
        List<Album> GetAlbumsByArtist(int pageIndex, int pageSize, string artistID, string accountName, out int totalCount);
        List<Album> GetAlbumsNewAHot(int pageIndex, int pageSize, int time, string accountName, out int totalCount);
        string GetAlbumDetail(string albumID, string accountName);
        string GetAlbumsForMana();
        string GetAlbumNation(int nation, string albumID);
        List<string> GetArtistSongForAlbumMana();
        List<Album> GetAlbumNation_T(int nation);
        string AddAlbum(string jsonAlbum);
        string DeleteAlbum(string albumID);
        string EditAlbum(string jsonAlbum);
       
        string LikeAlbum(string albumID, string accountName);
        string DislikeAlbum(string albumID, string accountName);
        List<Album> GetAlbumsLiked(int pageIndex, int pageSize, string accountName, out int totalCount);
        List<Album> GetAlbumsListened(int pageIndex, int pageSize, string accountName, out int totalCount);
        string AlbumListened(string albumID, string accountName);
    }
}


