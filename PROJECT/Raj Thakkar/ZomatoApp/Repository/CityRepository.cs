using ZomatoApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZomatoApp.Models;
using ZomatoApp.DBContext;
using Microsoft.EntityFrameworkCore;

namespace ZomatoApp.Repository
{
    public class CityRepository : GenericRepository<City>, ICity
    {
        private readonly ZomatoApp_ProjectContext _context;
        public CityRepository(ZomatoApp_ProjectContext context) : base(context)
        {
           _context=context;
        }


    public async Task<List<City>>GetCitiesAsync()
    {
        var records = await _context.Cities.Select(x => new City()
        {
            CityId = x.CityId,
            CityName = x.CityName
        }).ToListAsync();

        return records;
    }
}
}
