using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class EventOrganiserServices: GenericRepository<CharityEventOrganiser>, IEventOrganiser
    {
        private IHttpContextAccessor _accessor;
        private WebApiExceptionLogServices _webApi;
        public EventOrganiserServices(CharityAPIContext context, IHttpContextAccessor accessor) : base(context)
        {
            _accessor = accessor;
        }
        public override bool Create(CharityEventOrganiser events)
        {
            try
            {
                var result = context.CharityEventOrganiser.Add(events);
                context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                var log = new WebApiExceptionLog();
                log.StackTrace = ex.StackTrace;
                log.Message = ex.Message;
                log.IpAddress = _accessor.HttpContext.Connection.RemoteIpAddress.ToString();
                _webApi.Create(log);
                return false;
            }
        }
        // Update event type
        public override bool Update(long id, CharityEventOrganiser entity)
        {
            var existingEvent = context.CharityEventOrganiser.Find(id);

            if (existingEvent != null)
            {
                
                existingEvent.EventOrganiserId = entity.EventOrganiserId;
                existingEvent.EventId = entity.EventId;
                existingEvent.UpdatedBy = entity.UpdatedBy;
                existingEvent.UpdatedAt = DateTime.Now;

                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }

        }

        // Delete seat
        public override bool Delete(long id)
        {
            var existingEvent = context.CharityEventOrganiser.Find(id);

            if (existingEvent != null)
            {
                context.CharityEventOrganiser.Remove(existingEvent);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }


        }

        public IEnumerable GetByEventId(long EeventId)
        {
            var events = context.CharityEventOrganiser.Include(x=>x.EventOrganiser).Where(x => x.EventId == EeventId && x.IsPublished == true).ToList();
            return events;
        }

        public IEnumerable GetByOrganiserId(long orgId)
        {
            var events = context.CharityEventOrganiser.Include(x => x.Event).Where(x => x.EventOrganiserId == orgId && x.IsPublished == true).ToList();
            return events;
        }
    }
}
