using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicBus
{
    public interface IAlbumBus
    {
        List<Album> GetAlbumsPage(int pageIndex, int pageSize, int nation, string textSearch, string function, string accountName, out int totalCount);
        List<Album> Get10AlbumsRandom(string accountName);
        List<Album> GetAlbumsByArtist(int pageIndex, int pageSize, string artistID, string accountName, out int totalCount);
        List<Album> GetAlbumsNewAHot(int pageIndex, int pageSize, int time, string accountName, out int totalCount);
        string GetAlbumDetail(string albumID, string accountName);
        string GetAlbumNation(int nation, string albumID);
        string AddAlbum(string jsonAlbum);
        List<Album> GetAlbumNation_T(int nation);


    }
}
