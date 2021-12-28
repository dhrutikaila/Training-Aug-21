using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.IRepository
{
   public interface IAlbumlike
    {
        List<AlbumLike> GetSongs();
        AlbumLike Getlike(int id);
    }
}
