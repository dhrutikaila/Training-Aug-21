using MusicAppDB.IRepository;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Repository
{
    public class AlbumlikeRepository : IAlbumlike

    {
        private List<AlbumLike> Songs = new List<AlbumLike>()
        {
        };
        public AlbumLike Getlike(int id)
        {
            // throw new NotImplementedException();
            return Songs.SingleOrDefault(x => x.AlbumId == id);
        }

        public List<AlbumLike> GetSongs()
        {
            //throw new NotImplementedException();

            return Songs;

        }   
    }
}
