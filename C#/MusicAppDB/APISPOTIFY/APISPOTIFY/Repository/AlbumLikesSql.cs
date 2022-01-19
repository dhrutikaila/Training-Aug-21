using APISPOTIFY.IRepository;
using APISPOTIFY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.Repository
{
    public class AlbumLikesSql : IAlbumlike
    {
        private MusicAppDBContext _dBMUSICContext;
        public AlbumLikesSql(MusicAppDBContext dBMUSICContext)
        {
            _dBMUSICContext = dBMUSICContext;
        }
        public AlbumLike GetAlbumLike(int AlbumId,int UserId )
        {
            //throw new NotImplementedException();
            var song = _dBMUSICContext.AlbumLike.Find(AlbumId, UserId);
            return song;
        }

        public List<AlbumLike> GetAlbumLike()
        {
            // throw new NotImplementedException();
            return _dBMUSICContext.AlbumLike.ToList();
        }
    }
}
