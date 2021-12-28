using MusicAppDB.IRepository;
using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Repository
{
    public class CountryRepository : ICountry
    {
        private List<Country> Songs = new List<Country>()
        {
        };
        public List<Country> GetCountry()
        {
            return Songs;
            //throw new NotImplementedException();
        }

        public Country GetCountry(int id)
        {

            return Songs.SingleOrDefault(x => x.CountryId == id);
            // throw new NotImplementedException();
        }
    }
}
