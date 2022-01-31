using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace CharityAPI.Services
{
    public class ClusterLocationServices : GenericRepository<ClusterLocations>, IClusterLocation
    {
        public ClusterLocationServices(CharityAPIContext context) : base(context)
        {
          
        }

        //get all ClusterLocations
        public override IEnumerable<ClusterLocations> GetAll()
        {
            var clusterLocation = context.ClusterLocations.FromSqlRaw("exec getAllClusterLocations").ToList();
            return clusterLocation;
        }

        //get ClusterLocation by ClusterLocationId
        public IEnumerable<ClusterLocations> GetClusterLocation(long id)
        {
            var param = new SqlParameter("@locationId", id);
            var clusterLocation = context.ClusterLocations.FromSqlRaw("exec getClusterLocationByLocationId {0}", param).ToList();
            return clusterLocation;
        }

        //Create ClusterLocation
        public override bool Create(ClusterLocations clusterLocation)
        {
            var result = context.ClusterLocations.Add(clusterLocation);
            context.SaveChanges();
            return true;
        }


        //Update ClusterLocation
        public override bool Update(long id, ClusterLocations entity)
        {
            var existingClusLocation = context.ClusterLocations.Find(id);

            if(existingClusLocation != null)
            {
                existingClusLocation.UserId = entity.UserId;
                existingClusLocation.PostId = entity.PostId;
                existingClusLocation.RequirementTypeId = entity.RequirementTypeId;
                existingClusLocation.Locations = entity.Locations;
                existingClusLocation.CityId = entity.CityId;
                existingClusLocation.StateId = entity.StateId;
                existingClusLocation.PeopleCount = entity.PeopleCount;
                existingClusLocation.UpdatedBy = entity.UpdatedBy;
                existingClusLocation.UpdatedAt = DateTime.Now;
                existingClusLocation.PincodeId = entity.PincodeId;
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //Delete ClusterLocation
        public override bool Delete(long id)
        {
            var existingClusLocation = context.ClusterLocations.Find(id);

            if(existingClusLocation != null)
            {
                context.ClusterLocations.Remove(existingClusLocation);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //Get ClusterLocation by PincodeId
        public IEnumerable GetByPincodeId(long id)
        {
            var clusteredLocation = context.ClusterLocations.Where(x => x.PincodeId == id && x.IsPublished == true).ToList();
            return clusteredLocation;
        }

        //Get ClusterLocation by Pincode
        public IEnumerable GetByPincode(long pincode)
        {
            var clusteredLocation = context.ClusterLocations.Include(x => x.Pincode).Where(x => x.Pincode.Pincode1 == pincode && x.IsPublished == true).ToList();
            return clusteredLocation;
        }

        //Get ClusterLocation by CityId
        public IEnumerable GetByCityId(long id)
        {
            var clusteredLocation = context.ClusterLocations.Where(x => x.CityId == id && x.IsPublished == true).ToList();
            return clusteredLocation;
        }

        //Get ClusterLocation by CityName
        public IEnumerable GetByCityName(string name)
        {
            var clusteredLocation = context.ClusterLocations.Include(x => x.City).Where(x => x.City.CityName == name && x.IsPublished == true).ToList();
            return clusteredLocation;
        }

        //Get ClusterLocation by StateId
        public IEnumerable GetByStateId(long id)
        {
            var clusteredLocation = context.ClusterLocations.Where(x => x.StateId == id && x.IsPublished == true).ToList();
            return clusteredLocation;
        }

        //Get ClusterLocation by LocationName
        public IEnumerable GetByLocationName(string name)
        {
            var clusteredLocation = context.ClusterLocations.Where(x => x.Locations == name && x.IsPublished == true).ToList();
            return clusteredLocation;
        }

        //Get ClusterLocation by RequirmentTypeId
        public IEnumerable GetByRequirementId(long id)
        {
            var clusteredLocation = context.ClusterLocations.Where(x => x.RequirementTypeId == id && x.IsPublished == true).ToList();
            return clusteredLocation;
        }

        

        

        
    }
}
