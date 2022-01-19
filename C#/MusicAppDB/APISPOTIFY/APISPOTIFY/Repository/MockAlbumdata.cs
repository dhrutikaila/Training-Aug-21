using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using APISPOTIFY.IRepository;
using APISPOTIFY.Models;

namespace APISPOTIFY.Repository
{
    public class MockAlbumdata : IAlbumdata

    {
        private MusicAppDBContext _dB_MUSICContext;
        public MockAlbumdata(MusicAppDBContext dB_MUSICContext)
        {
            _dB_MUSICContext = dB_MUSICContext;
        }
       

        public List<Album> GetAlbums()
        {
            return _dB_MUSICContext.Albums.ToList();
        }

        public Album GetAlbum(int id)
        {
            var album = _dB_MUSICContext.Albums.Find(id);
            return album;
        }

        public Album AddAlbum(Album song)
        {
           // song.AlbumId = int.Parse(Console.ReadLine());
            _dB_MUSICContext.Albums.Add(song);
            _dB_MUSICContext.SaveChanges();
            return song;
        }

        public void DeleteAlbum(Album song)
        {
           

                _dB_MUSICContext.Albums.Remove(song);
            _dB_MUSICContext.SaveChanges();
        }

        public Album EditAlbum(Album song)
        {
            var existingSong = _dB_MUSICContext.Albums.Find(song.AlbumId);

            if(existingSong !=null)
            {
                existingSong.Name = song.Name;
                _dB_MUSICContext.Albums.Update(song);
                _dB_MUSICContext.SaveChanges();

            }
            return song;
        }
    }
}
