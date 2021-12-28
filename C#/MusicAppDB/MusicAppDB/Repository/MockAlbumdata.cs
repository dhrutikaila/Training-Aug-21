using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MusicAppDB.IRepository;
using MusicAppDB.Models;

namespace MusicAppDB.Repository
{
    public class MockAlbumdata : IAlbumdata

    {
        public Album AddAlbum(Album song)
        {
            throw new NotImplementedException();
        }

       

        public void DeleteAlbum(Album song)
        {
            throw new NotImplementedException();
        }

       

        public Album EditAlbum(Album song)
        {
            throw new NotImplementedException();
        }

        

        public Album GetAlbum(int id)
        {
            throw new NotImplementedException();
        }

        public List<Album> GetAlbums()
        {
            throw new NotImplementedException();
        }

        
    }
}
