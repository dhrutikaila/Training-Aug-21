using MusicAppDB.IRepository;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Repository
{
    public class PlaylistRepository : IPlaylist
    {
        private List<Playlist> Playlists = new List<Playlist>()
        {
         

        };
        public Playlist AddPlaylist(Playlist song)
        {
            //song.SongID = int.Parse(Console.ReadLine());
            Playlists.Add(song);
            return song;
        }

        public void DeletePlaylist(Playlist song)
        {
            Playlists.Remove(song);
        }

        public Playlist EditPlaylist(Playlist song)
        {
            var existingSong = GetPlaylist(song.PlaylistId);
            existingSong.PlaylistSongs = song.PlaylistSongs;
            return existingSong;

        }

        public List<Playlist> GetAlbums()
        {
            return Playlists;
        }

        public Playlist GetPlaylist(int id)
        {
            return Playlists.SingleOrDefault(x => x.PlaylistId == id);
        }
    }
}
