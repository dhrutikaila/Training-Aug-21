using APISPOTIFY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.IRepository
{
   public interface IAlbumlike
    {
        List<AlbumLike> GetAlbumLike();
        AlbumLike GetAlbumLike(int AlbumId,int UserId);
    }
}
