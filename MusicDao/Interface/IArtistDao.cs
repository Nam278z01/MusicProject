using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public interface IArtistDao
    {
        List<Artist> GetArtistAll();
        List<Artist> GetArtistsPage(int pageIndex, int pageSize, int nation, int genderorband, string textSearch, string function, out int totalCount);
        List<Artist> GetArtistsHot(int pageIndex, int pageSize, int time, int genderorband, out int totalCount);
        string GetArtistDetail(string artistID);
        string GetArtistsForMana();
        string AddArtist(Artist at);
        string DeleteArtist(string id);
        string EditArtist(Artist al);
        ArtistList GetArtistPage(int pageIndex, int pageSize, string ArtistName);
    }
}
