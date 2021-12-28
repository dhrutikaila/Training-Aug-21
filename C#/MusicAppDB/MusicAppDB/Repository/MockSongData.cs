using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.IRepository
{

    public class MockSongData : ISongdata
    {

        private List<Song> Songs = new List<Song>()
        {
          new Song()
          {

              SongFile="khuda hai kaha he tu"
          }
         
        };
        public Song AddSong(Song song)
        {
            //song.SongID = int.Parse(Console.ReadLine());
            Songs.Add(song);
            return song;
        }

        public void DeleteSong(Song song)
        {
            Songs.Remove(song);
        }

        public Song EditSong(Song song)
        {
            var existingSong = GetSong(song.SongID);
            existingSong.Name = song.Name;
            return existingSong;


        }

        public Song GetSong(int id)
        {
            return Songs.SingleOrDefault(x => x.SongID == id);
        }

        public List<Song> GetSongs()
        {
            return Songs;
        }
    }
}
