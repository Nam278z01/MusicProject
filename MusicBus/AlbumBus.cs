using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class AlbumBus : IAlbumBus
    {
        IAlbumDao aldao;
        public AlbumBus()
        {
            aldao = new AlbumDao();
        }
        public List<Album> GetAlbumsPage(int pageIndex, int pageSize, int nation, string textSearch, string function, string accountName, out int totalCount)
        {
            return aldao.GetAlbumsPage(pageIndex, pageSize, nation,textSearch, function,accountName, out totalCount);
        }
        public List<Album> Get10AlbumsRandom(string accountName)
        {
            return aldao.Get10AlbumsRandom(accountName);
        }
        public List<Album> GetAlbumsByArtist(int pageIndex, int pageSize, string artistID, string accountName, out int totalCount)
        {
            return aldao.GetAlbumsByArtist(pageIndex, pageSize, artistID, accountName, out totalCount);
        }
        public List<Album> GetAlbumsNewAHot(int pageIndex, int pageSize, int time, string accountName, out int totalCount)
        {
            return aldao.GetAlbumsNewAHot(pageIndex, pageSize, time, accountName, out totalCount);
        }
        public string GetAlbumDetail(string albumID, string accountName)
        {
            return aldao.GetAlbumDetail(albumID, accountName);
        }
        public string GetAlbumNation(int nation, string albumID)
        {
            return aldao.GetAlbumNation(nation, albumID);
        }
        public List<Album> GetAlbumNation_T(int nation)
        {
            return aldao.GetAlbumNation_T(nation);
        }
        public string AddAlbum(string jsonAlbum)
        {
            return aldao.AddAlbum(jsonAlbum);
        }
    }
}
