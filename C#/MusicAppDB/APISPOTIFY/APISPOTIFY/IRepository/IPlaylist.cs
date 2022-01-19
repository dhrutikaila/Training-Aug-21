using APISPOTIFY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.IRepository
{
   public interface IPlaylist
    {
        List<Playlist> GetAlbums();
        Playlist GetPlaylist(int id);
        Playlist AddPlaylist(Playlist song);
        void DeletePlaylist(Playlist song);
        Playlist EditPlaylist(Playlist song);
    }
}
