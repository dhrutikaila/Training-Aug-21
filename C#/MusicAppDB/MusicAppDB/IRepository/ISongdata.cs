
using MusicAppDB.Models;
using System;
using System.Collections.Generic;

namespace MusicAppDB.IRepository
{
  public interface ISongdata
    {
        List<Song> GetSongs();
        Song GetSong(int id);
        Song AddSong(Song song);
        void DeleteSong(Song song);
        Song EditSong(Song song);
      
    }
}
