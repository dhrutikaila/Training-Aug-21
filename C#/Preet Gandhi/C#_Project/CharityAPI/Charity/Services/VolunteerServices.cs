using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace CharityAPI.Services
{
    public class VolunteerServices : GenericRepository<Volunteer>, IVolunteer
    {
        public VolunteerServices(CharityAPIContext context) : base(context)
        {

        }

        //get all Volunteers
        public override IEnumerable<Volunteer> GetAll()
        {
            var volunteer = context.Volunteer.FromSqlRaw("exec getAllVolunteers").ToList();
            return volunteer;
        }

        //Create Volunteer
        public override bool Create(Volunteer volunteer)
        {
            var result = context.Volunteer.Add(volunteer);
            context.SaveChanges();
            return true;
        }

        //Update Volunteer
        public override bool Update(long id, Volunteer entity)
        {
            var existingVolunteer = context.Volunteer.Find(id);

            if (existingVolunteer != null)
            {
                existingVolunteer.VolunteerUserId = entity.VolunteerUserId;
                existingVolunteer.OrganisationId = entity.OrganisationId;
                existingVolunteer.UpdatedBy = entity.UpdatedBy;
                existingVolunteer.UpdatedAt = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //Delete Volunteer
        public override bool Delete(long id)
        {
            var existingVolunteer = context.Volunteer.Find(id);

            if (existingVolunteer != null)
            {
                context.Volunteer.Remove(existingVolunteer);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //Get Volunteer by UserId
        public IEnumerable GetByUserId(long id)
        {
            var volunteer = context.Volunteer.Where(x => x.VolunteerUserId == id && x.IsPublished == true).ToList();
            return volunteer;
        }

        //Get Volunteer by OrganisationId
        public IEnumerable GetByOrganisationId(long id)
        {
            var volunteer = context.Volunteer.Where(x => x.OrganisationId == id && x.IsPublished == true).ToList();
            return volunteer;
        }

        //Get Volunteer by OrganisationId
        public IEnumerable GetByOrganisationName(string name)
        {
            var volunteer = context.Volunteer.Include(x => x.Organisation).Where(x => x.Organisation.OrganisationName == name && x.IsPublished == true).ToList();
            return volunteer;
        }


    }
}
