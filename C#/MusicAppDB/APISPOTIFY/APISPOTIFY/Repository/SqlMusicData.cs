using APISPOTIFY.IRepository;
using APISPOTIFY.Models;
using MusicAppDB.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MusicAppDB.Repository
{
    public class SqlMusicData : ISongdata
    {
        private MusicAppDBContext _dB_MUSICContext;
        public SqlMusicData(MusicAppDBContext dB_MUSICContext)
        {
            _dB_MUSICContext = dB_MUSICContext;
        }
       

        public Song AddSong(Song song)
        {
          //song.SongId = int.Parse(Console.ReadLine());
            _dB_MUSICContext.Song.Add(song);
            _dB_MUSICContext.SaveChanges();
            return song;
        }

        public void DeleteSong(Song song)
        {

            _dB_MUSICContext.Song.Remove(song);
            _dB_MUSICContext.SaveChanges();
        }

        public Song EditSong(Song song)
        {
            var existingSong = _dB_MUSICContext.Song.Find(song.SongId);

            if (existingSong != null)
            {
               existingSong.Name = song.Name;
                _dB_MUSICContext.Song.Update(existingSong);
                _dB_MUSICContext.SaveChanges();

            }
            return song;
        }

        public Song GetSong(int id)
        {
            var song = _dB_MUSICContext.Song.Find(id);
            return song;
            
           // return _dB_MUSICContext.Songs.SingleOrDefault(x => x.SongID == id);
          
        }

        public List<Song> GetSong()
        {
            return _dB_MUSICContext.Song.ToList();


        }
    }
}
