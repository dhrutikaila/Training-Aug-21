using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class CityServices: GenericRepository<Cities>, ICities
    {
        public CityServices(CharityAPIContext context) : base(context)
        {

        }

        //get all cities 
        public override IEnumerable<Cities> GetAll()
        {
            var cities = context.Cities.FromSqlRaw("exec getAllcities").ToList();

            return cities;
        }

        //get city by city id
        public IEnumerable GetCityById(long id)
        {

            var param = new SqlParameter("@cityid", id);
            var cities = context.Cities.FromSqlRaw("exec getCityByCityId {0}", param).ToList();

            return cities;
        }

        //get city by state id
        public IEnumerable GetCityByStateId(long sid)
        {

            var param = new SqlParameter("@stateid", sid);
            var cities = context.Cities.FromSqlRaw("exec getCityByStateId {0}", param).ToList();

            return cities;
        }

        //get city by city name
        public IEnumerable GetCityByCityName(string sname)
        {

            var param = new SqlParameter("@cityname", sname);
            var city = context.Cities.FromSqlRaw("exec getCityByCityName {0}", param).ToList();

            return city;
        }



        //create city
        public override bool Create(Cities cities)
        {
            var result = context.Cities.Add(cities);
            context.SaveChanges();
            return true;
        }

        //update city
        public override bool Update(long id, Cities cities)
        {
            var existingcity = context.Cities.Find(id);

            if (existingcity != null)
            {
                //existingcity.CityId = cities.CityId;
                existingcity.CityName = cities.CityName;
                existingcity.StateId = cities.StateId;
                existingcity.UpdatedBy = cities.UpdatedBy;
                existingcity.UpdatedAt = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }

        }

        //delete city

        public override bool Delete(long id)
        {
            var existingcity = context.Cities.Find(id);

            if (existingcity != null)
            {
                context.Cities.Remove(existingcity);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
