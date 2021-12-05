using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class ArtistBus : IArtistBus
    {
        IArtistDao atdao;
        public ArtistBus()
        {
            atdao = new ArtistDao();
        }
        public List<Artist> GetArtistsPage(int pageIndex, int pageSize, int nation, int genderorband, string textSearch, string function, out int totalCount)
        {
            return atdao.GetArtistsPage(pageIndex, pageSize, nation, genderorband, textSearch, function, out totalCount);
        }
        public List<Artist> GetArtistsHot(int pageIndex, int pageSize, int time, int genderorband, out int totalCount)
        {
            return atdao.GetArtistsHot(pageIndex, pageSize, time, genderorband, out totalCount);
        }
    }
}
