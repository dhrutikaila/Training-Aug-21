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
    public class CharityEventInteractServices : GenericRepository<CharityEventInteract>, ICharityEventInteract
    {
        public CharityEventInteractServices(CharityAPIContext context) : base(context)
        {

        }

        //get all CharityEventInteract
        public override IEnumerable<CharityEventInteract> GetAll()
        {
            var charityEventInteract = context.CharityEventInteract.FromSqlRaw("exec getAllCharityEventInteracts").ToList();
            return charityEventInteract;
        }

        //Create CharityEventInteract
        public override bool Create(CharityEventInteract charityEventInteract)
        {
            var result = context.CharityEventInteract.Add(charityEventInteract);
            context.SaveChanges();
            return true;
        }

        //Update CharityEventInteract
        public override bool Update(long id, CharityEventInteract entity)
        {
            var existingEventInteract = context.CharityEventInteract.Find(id);

            if (existingEventInteract != null)
            {
                existingEventInteract.EventId = entity.EventId;
                existingEventInteract.UserId = entity.UserId;
                existingEventInteract.IsInterested = entity.IsInterested;
                existingEventInteract.IsGoing = entity.IsGoing;
                existingEventInteract.UpdatedBy = entity.UpdatedBy;
                existingEventInteract.UpdatedAt = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //Delete CharityEventInteract
        public override bool Delete(long id)
        {
            var existingEventInteract = context.CharityEventInteract.Find(id);

            if (existingEventInteract != null)
            {
                context.CharityEventInteract.Remove(existingEventInteract);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //Get CharityEventInteract by EventId
        public IEnumerable GetByEventId(long id)
        {
            var eventInteract = context.CharityEventInteract.Where(x => x.EventId == id && x.IsPublished == true).ToList();
            return eventInteract;
        }

        //Get CharityEventInteract by UserId
        public IEnumerable GetByUserId(long id)
        {
            var eventInteract = context.CharityEventInteract.Where(x => x.UserId == id && x.IsPublished == true).ToList();
            return eventInteract;
        }

        //Get IsInterested by EventId
        public IEnumerable GetInterestedByEventId(long id)
        {
            var eventInterested = context.CharityEventInteract.Where(x => x.EventId == id && x.IsPublished == true).Where(x => x.IsInterested).ToList();
            return eventInterested;
        }

        //Get IsInterested by UserID
        public IEnumerable GetInterestedByUserId(long id)
        {
            var eventInterested = context.CharityEventInteract.Where(x => x.UserId == id && x.IsPublished == true).Where(x => x.IsInterested).ToList();
            return eventInterested;
        }

        //Get IsGoing by EventId
        public IEnumerable GetGoingByEventId(long id)
        {
            var eventInterested = context.CharityEventInteract.Where(x => x.EventId == id && x.IsPublished == true).Where(x => x.IsGoing).ToList();
            return eventInterested;
        }

        //Get IsGoing by UserID
        public IEnumerable GetGoingByUserId(long id)
        {
            var eventInterested = context.CharityEventInteract.Where(x => x.UserId == id && x.IsPublished == true).Where(x => x.IsGoing).ToList();
            return eventInterested;
        }
    }
}
