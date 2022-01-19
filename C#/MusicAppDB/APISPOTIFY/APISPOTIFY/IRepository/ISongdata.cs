
using APISPOTIFY.Models;
using System;
using System.Collections.Generic;

namespace APISPOTIFY.IRepository
{
  public interface ISongdata
    {
        List<Song> GetSong();
        Song GetSong(int id);
        Song AddSong(Song song);
        void DeleteSong(Song song);
        Song EditSong(Song song);
      
    }
}
