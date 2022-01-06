using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class ArtistManaBus : IArtistManaBus
    {
        IArtistDao adao;
        public ArtistManaBus()
        {
            adao = new ArtistDao();
        }
        public string GetArtistsForMana()
        {
            return adao.GetArtistsForMana();
        }
        public string AddArtist(Artist s)
        {
            return adao.AddArtist(s);
        }
        public string DeleteArtist(string id)
        {
            return adao.DeleteArtist(id);
        }
        public string EditArtist(Artist al)
        {
            return adao.EditArtist(al);
        }
        public ArtistList GetArtistPage(int pageIndex, int pageSize, string ArtistName)
        {
            return adao.GetArtistPage(pageIndex, pageSize, ArtistName);
        }
    }
}
