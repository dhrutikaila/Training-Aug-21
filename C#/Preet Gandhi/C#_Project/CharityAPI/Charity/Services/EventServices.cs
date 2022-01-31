using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class EventServices : GenericRepository<CharityEvent>, IEvent
    {
        private IHttpContextAccessor _accessor;
        private WebApiExceptionLogServices _webApi;
        //private PincodeServices _pincode;

        public EventServices(CharityAPIContext context, IHttpContextAccessor accessor) : base(context)
        {
            _accessor = accessor;

        }
        public bool Create(CharityEvent events, Image file,string fileName)
        {
            if (file != null)
            {
                var result = context.CharityEvent.Add(events);
                var commonHelper = new CommonHelper();
                context.SaveChanges();


                var imagepath = commonHelper.GetEventBannerPath(events.EventOrganiserId, events.EventId);
                // Create directory Path if not Exit
                commonHelper.CreateDirectory(imagepath);
                var imageFileName = Path.GetFileName(events.EventBannerUrl);

                if (!string.IsNullOrEmpty(imageFileName) && imageFileName.Contains("?t="))
                {
                    imageFileName = imageFileName.Split('?')[0].ToString();
                }
                if (!string.IsNullOrEmpty(imageFileName))
                {
                    // Delete file path if exit
                    commonHelper.DeleteFilePath(imagepath, imageFileName);
                }

                events.EventBannerUrl = fileName;
                var fileSavePath = Path.Combine(imagepath, events.EventBannerUrl);
                file.Save(fileSavePath);
                
                return true;
            }
            else
            {
                return false;
            }
            
        }

        // Update event type
        public bool Update(long id, CharityEvent entity, Image file)
        {
            
            var existingEvent = context.CharityEvent.Find(id);

            if (existingEvent != null)
            {
                if (file != null)
                {
                    var commonHelper = new CommonHelper();
                    var imagepath = commonHelper.GetEventBannerPath(entity.EventOrganiserId, entity.EventId);
                    // Create directory Path if not Exit
                    commonHelper.CreateDirectory(imagepath);
                    var imageFileName = Path.GetFileName(entity.EventBannerUrl);

                    if (!string.IsNullOrEmpty(imageFileName) && imageFileName.Contains("?t="))
                    {
                        imageFileName = imageFileName.Split('?')[0].ToString();
                    }
                    if (!string.IsNullOrEmpty(imageFileName))
                    {
                        // Delete file path if exit
                        commonHelper.DeleteFilePath(imagepath, imageFileName);
                    }

                    //entity.EventBannerUrl = fileName;
                    var fileSavePath = Path.Combine(imagepath, entity.EventBannerUrl);
                    file.Save(fileSavePath);
                }
                existingEvent.EventDescription = entity.EventDescription;
                existingEvent.EventEndDate = entity.EventEndDate;
                existingEvent.EventStartDate = entity.EventStartDate;
                existingEvent.EventName = entity.EventName;
                existingEvent.EventOrganiser = entity.EventOrganiser;
                existingEvent.PincodeId = entity.PincodeId;
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
            var existingEvent = context.CharityEvent.Find(id);

            if (existingEvent != null)
            {
                var commonHelper = new CommonHelper();
                var imagepath = commonHelper.GetEventBannerPath(existingEvent.EventOrganiserId, id);
                commonHelper.DeleteFolder(imagepath);
                context.CharityEvent.Remove(existingEvent);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
            

        }

        public IEnumerable GetByName(string name)
        {
            var events = context.CharityEvent.Where(x => x.EventName == name && x.IsPublished == true).ToList();
            return events;

        }

        public IEnumerable GetByType(string type)
        {

            var events = context.CharityEvent.Where(x => x.EventType == type&& x.IsPublished == true).ToList();
            return events;
        }

        public IEnumerable GetByCity(long cityId)
        {
            var events = context.CharityEvent.Include(x=>x.Pincode).ThenInclude(x=>x.City).Where(x => x.Pincode.City.CityId == 123 && x.IsPublished == true).ToList();
            return events;
        }

        public IEnumerable GetByPincode(long pincode)
        {
            //get pincodeId
            var events = context.CharityEvent.Include(x => x.Pincode).Where(x => x.Pincode.Pincode1 == pincode && x.IsPublished == true).ToList();
            return events;
        }

        public IEnumerable GetByOrganisation(long orgId)
        {
            var events = context.CharityEvent.Where(x => x.EventOrganiserId == orgId && x.IsPublished == true).ToList();
            return events;
        }

        public IEnumerable GetByDate(DateTime date)
        {
            var events = context.CharityEvent.Where(x => (x.EventStartDate.Date <= date.Date|| x.EventEndDate.Date >= date.Date) && x.IsPublished == true).ToList();
            return events;
        }

        public IEnumerable GetCurrent()
        {
            var events = context.CharityEvent.Where(x => (x.EventStartDate.Date <= DateTime.Now.Date || x.EventEndDate.Date >= DateTime.Now.Date) && x.IsPublished == true).ToList();
            return events;
        }
        #region 'Private Methods ' 
        

        #endregion 'Private Methods '
    }
}
