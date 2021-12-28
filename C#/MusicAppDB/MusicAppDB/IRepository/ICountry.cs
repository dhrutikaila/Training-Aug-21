using MusicAppDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.IRepository
{
public interface ICountry
    {
        List<Country> GetCountry();
        Country GetCountry(int id);
    }
}
