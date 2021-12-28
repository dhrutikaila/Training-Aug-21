using MusicAppDB.IRepository;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Repository
{
    public class SqlMusicData : ISongdata
    {
        private DB_MUSICContext _dB_MUSICContext;
        public SqlMusicData(DB_MUSICContext dB_MUSICContext)
        {
            _dB_MUSICContext = dB_MUSICContext;
        }

        public Song AddSong(Song song)
        {
            throw new NotImplementedException();
        }

        public void DeleteSong(Song song)
        {
            throw new NotImplementedException();
        }

        public Song EditSong(Song song)
        {
            throw new NotImplementedException();
        }

        public Song GetSong(int id)
        {
            var song = _dB_MUSICContext.Songs.Find(id);
            return song;
           // return _dB_MUSICContext.Songs.SingleOrDefault(x => x.SongID == id);
          
        }

        public List<Song> GetSongs()
        {
            return _dB_MUSICContext.Songs.ToList();


        }
    }
}
