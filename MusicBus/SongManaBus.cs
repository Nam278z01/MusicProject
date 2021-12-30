using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;


namespace MusicBus
{
    public class SongManaBus : ISongManaBus
    {
        ISongDao sdao;
        public SongManaBus()
        {
            sdao = new SongDao();
        }
        public string GetSongsForMana()
        {
            return sdao.GetSongsForMana();
        }

        public List<string> GetAlbumsGenresArtistsForManaSong()
        {
            return sdao.GetAlbumsGenresArtistsForManaSong();
        }
        public string AddSong(string jsonSong)
        {
            return sdao.AddSong(jsonSong);
        }
        public string EditSong(string jsonSong)
        {
            return sdao.EditSong(jsonSong);
        }
        public string DeleteSong(string songID)
        {
            return sdao.DeleteSong(songID);
        }
    }
}
