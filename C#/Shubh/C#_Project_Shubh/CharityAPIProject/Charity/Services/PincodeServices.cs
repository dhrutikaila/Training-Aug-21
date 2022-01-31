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
    public class PincodeServices : GenericRepository<Pincode>, IPincode
    {
        public PincodeServices(CharityAPIContext context) : base(context)
        {

        }

        //create pincode
        public override bool Create(Pincode pincode)
        {
            var result = context.Pincode.Add(pincode);
            context.SaveChanges();
            return true;
        }

        //get all pincode 
        public override IEnumerable<Pincode> GetAll()
        {
            var state = context.Pincode.FromSqlRaw("exec getAllPincode").ToList();

            return state;
        }

        //get pincode by pincode id
        public IEnumerable GetPincodeById(long id)
        {

            var param = new SqlParameter("@pincodeid", id);
            var pincode = context.Pincode.FromSqlRaw("exec getPincodeByPincodeId {0}", param).ToList();

            return pincode;
        }

        //get pincode by pincode 
        public IEnumerable GetPincodeByPincode(long pincode)
        {

            var param = new SqlParameter("@pincode", pincode);
            var pincodes = context.Pincode.FromSqlRaw("exec getPincodeByPincode {0}", param).ToList();

            return pincodes;
        }

        //get pincode by city id 
        public IEnumerable GetPincodeByCityId(long cityid)
        {

            var param = new SqlParameter("@cityid", cityid);
            var pincodes = context.Pincode.FromSqlRaw("exec getPincodeByCityId {0}", param).ToList();

            return pincodes;
        }

        //get pincode by state id 
        public IEnumerable GetPincodeByStateId(long stateid)
        {

            var param = new SqlParameter("@stateid", stateid);
            var pincodes = context.Pincode.FromSqlRaw("exec getPincodeByStateId {0}", param).ToList();

            return pincodes;
        }

        //get pincode by postoffice name
        public IEnumerable GetPincodeByPostOfficeName(string pname)
        {

            var param = new SqlParameter("@postoffice", pname);
            var pincodes = context.Pincode.FromSqlRaw("exec getPincodeByPostOfficeName {0}", param).ToList();

            return pincodes;
        }

        //update pincode

        public override bool Update(long id, Pincode pincode)
        {
            var existingpincode= context.Pincode.Find(id);

            if (existingpincode != null)
            {
                //existingstate.StateId = entity.StateId;
                existingpincode.PostOfficeName = pincode.PostOfficeName;
                existingpincode.StateId = pincode.StateId;
                existingpincode.Pincode1 = pincode.Pincode1;
                existingpincode.CityId = pincode.CityId;
                //existingpincode.City = pincode.City;
                existingpincode.District = pincode.District;
                existingpincode.UpdatedBy = pincode.UpdatedBy;
                existingpincode.UpdatedAt = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }

        }

        //delete pincode

        public override bool Delete(long id)
        {
            var existingpincode = context.Pincode.Find(id);

            if (existingpincode != null)
            {
                context.Pincode.Remove(existingpincode);
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
