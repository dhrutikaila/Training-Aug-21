using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.IRepository
{
  public  interface IGenres
    {
        List<Genres> GetGenres();
        Genres GetGenres(int id);
        Genres AddGenres(Genres song);
        void DeleteGenres(Genres song);
        Genres EditGenres(Genres song);
    }
}
