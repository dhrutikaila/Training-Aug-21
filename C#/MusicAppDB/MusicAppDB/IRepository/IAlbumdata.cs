using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.IRepository
{
   public interface IAlbumdata
    {
        List<Album> GetAlbums();
        Album GetAlbum(int id);
        Album AddAlbum(Album song);
        void DeleteAlbum(Album song);
        Album EditAlbum(Album song);
    }
}
