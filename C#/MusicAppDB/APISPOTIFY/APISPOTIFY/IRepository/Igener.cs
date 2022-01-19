using APISPOTIFY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.IRepository
{
  public  interface Igener
    {
        List<Genre> Getgenre();
        Genre Getgenre(int AlbumId, int UserId);
    }
}
