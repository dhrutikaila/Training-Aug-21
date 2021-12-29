using MusicAppDB.IRepository;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Repository
{
    public class GenresRepository : IGenres
    {

        private List<Genres> genres = new List<Genres>()
        {
          new Genres()
          {

              Genre="radha krishna"
          }

        };
        public Genres AddGenres(Genres song)
        {
            //song.SongID = int.Parse(Console.ReadLine());
            genres.Add(song);
            return song;
        }

        public void DeleteGenres(Genres song)
        {
            genres.Remove(song);
        }

        public Genres EditGenres(Genres song)
        {
            var existingSong = GetGenres(song.GenreId);
            existingSong.Genre = song.Genre;
            return existingSong;

        }

        public List<Genres> GetGenres()
        {
            return genres;
           
        }

        public Genres GetGenres(int id)
        {
            return genres.SingleOrDefault(x => x.GenreId == id);
        }
    }
}
