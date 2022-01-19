using APISPOTIFY.IRepository;
using APISPOTIFY.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.Repository
{
    public class PlaylistRepository : IPlaylist
    {
        private MusicAppDBContext _dB_MUSICContext;
        public PlaylistRepository(MusicAppDBContext dB_MUSICContext)
        {
            _dB_MUSICContext = dB_MUSICContext;
        }

        public Playlist AddPlaylist(Playlist song)
        {
            song.PlaylistId = int.Parse(Console.ReadLine());
            _dB_MUSICContext.Playlists.Add(song);
            _dB_MUSICContext.SaveChanges();
            return song;
        }

        public void DeletePlaylist(Playlist song)
        {

            _dB_MUSICContext.Playlists.Remove(song);
            _dB_MUSICContext.SaveChanges();
        }

        public Playlist EditPlaylist(Playlist song)
        {
            var existingSong = _dB_MUSICContext.Playlists.Find(song.PlaylistId);

            if (existingSong != null)
            {
                existingSong.PlaylistSongs = song.PlaylistSongs;
                _dB_MUSICContext.Playlists.Update(song);
                _dB_MUSICContext.SaveChanges();

            }
            return song;

        }

        public List<Playlist> GetAlbums()
        {
            return _dB_MUSICContext.Playlists.ToList();
        }

        public Playlist GetPlaylist(int id)
        {
            var album = _dB_MUSICContext.Playlists.Find(id);
            return album;
        }
    }
}
