using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace CharityAPI.Services
{
    public class OrganisationDataServices : GenericRepository<OrganisationData>, IOrganisationData
    {
        public OrganisationDataServices(CharityAPIContext context) : base(context)
        {

        }

        //get all OrganisationData
        public override IEnumerable<OrganisationData> GetAll()
        {
            var organisationData = context.OrganisationData.FromSqlRaw("exec getAllOrganisationDatas").ToList();
            return organisationData;
        }

        //Create ClusterLocation
        public bool Create(OrganisationData organisationData, Image file, string fileName)
        {
            if (file != null)
            {
                var result = context.OrganisationData.Add(organisationData);
                var commonHelper = new CommonHelper();
                context.SaveChanges();
                var imagepath = commonHelper.GetOrganisationPath(organisationData.OrganisationDataId);

                // Create directory Path if not Exit
                commonHelper.CreateDirectory(imagepath);
                var imageFileName = Path.GetFileName(organisationData.OrganisationLogoUrl);

                if (!string.IsNullOrEmpty(imageFileName) && imageFileName.Contains("?t="))
                {
                    imageFileName = imageFileName.Split('?')[0].ToString();
                }
                if (!string.IsNullOrEmpty(imageFileName))
                {
                    // Delete file path if exit
                    commonHelper.DeleteFilePath(imagepath, imageFileName);
                }
                var fileSavePath = Path.Combine(imagepath, fileName);
                file.Save(fileSavePath);

                return true;
            }
            else
            {
                return false;
            }
        }

        //Update ClusterLocation
        public bool Update(long id, OrganisationData entity, Image file)
        {
            var existingOrganisationData = context.OrganisationData.Find(id);

            if (existingOrganisationData != null)
            {
                if (file != null)
                {
                    var commonHelper = new CommonHelper();
                    var imagepath = commonHelper.GetOrganisationPath(entity.OrganisationDataId);

                    // Create directory Path if not Exit
                    commonHelper.CreateDirectory(imagepath);
                    var imageFileName = Path.GetFileName(entity.OrganisationLogoUrl);

                    if (!string.IsNullOrEmpty(imageFileName) && imageFileName.Contains("?t="))
                    {
                        imageFileName = imageFileName.Split('?')[0].ToString();
                    }
                    if (!string.IsNullOrEmpty(imageFileName))
                    {
                        // Delete file path if exit
                        commonHelper.DeleteFilePath(imagepath, imageFileName);
                    }
                    var fileSavePath = Path.Combine(imagepath, entity.OrganisationLogoUrl);
                    file.Save(fileSavePath);
                }
                existingOrganisationData.OrganisationUserId = entity.OrganisationUserId;
                existingOrganisationData.OrganisationName = entity.OrganisationName;
                existingOrganisationData.OrganisationAddress = entity.OrganisationAddress;
                existingOrganisationData.OrganisationContactNo = entity.OrganisationContactNo;
                existingOrganisationData.OrganisationLogoUrl = entity.OrganisationLogoUrl;
                existingOrganisationData.UpdatedBy = entity.UpdatedBy;
                existingOrganisationData.UpdatedAt = DateTime.Now;
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
            var existingOrganisationData = context.OrganisationData.Find(id);

            if (existingOrganisationData != null)
            {
                context.OrganisationData.Remove(existingOrganisationData);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //Get OrganisationData by OrganisationName
        public OrganisationData GetByOrganisationName(string name)
        {
            var organisationData = context.OrganisationData.SingleOrDefault(x => x.OrganisationName == name && x.IsPublished == true);
            return organisationData;
        }

        //Get OrganisationData by OrganisationUserId
        public OrganisationData GetByUserId(long id)
        {
            var organisationData = context.OrganisationData.SingleOrDefault(x => x.OrganisationUserId == id && x.IsPublished == true);
            return organisationData;
        }

        //public IEnumerable GetByCity(long id)
        //{
        //    var organisationData = context.OrganisationData.Include(x => x.UserData).ThenInclude(xy => xy.OrganisationData)
        //    return organisationData;
        //}
    }
}
