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
    public class UserDataServices : GenericRepository<UserData>, IUserData
    {
        public UserDataServices(CharityAPIContext context) : base(context)
        {

        }

        //get all UserData
        public override IEnumerable<UserData> GetAll()
        {
            var userData = context.UserData.FromSqlRaw("exec getAllUserData").ToList();
            return userData;
        }

        //Create UserData
        public bool Create(UserData userData, Image file, string fileName)
        {
            if (file != null)
            {
                var p = context.UserData.Add(userData);
                var commonHelper = new CommonHelper();
                context.SaveChanges();
                var imagepath = commonHelper.GetUserPath(userData.UserId);

                // Create directory Path if not Exit
                commonHelper.CreateDirectory(imagepath);
                var imageFileName = Path.GetFileName(userData.ProfileImage);

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

        //Update UserData
        public bool Update(long id, UserData entity, Image file)
        {
            var existingUserData = context.UserData.Find(id);

            if (existingUserData != null)
            {
                if (file != null)
                {
                    var commonHelper = new CommonHelper();
                    var imagepath = commonHelper.GetUserPath(entity.UserId);

                    commonHelper.CreateDirectory(imagepath);
                    var imageFileName = Path.GetFileName(entity.ProfileImage);
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
                    var fileSavePath = Path.Combine(imagepath, entity.ProfileImage);
                    file.Save(fileSavePath);
                }
                existingUserData.FirstName = entity.FirstName;
                existingUserData.LastName = entity.LastName;
                existingUserData.Gender = entity.Gender;
                existingUserData.ProfileImage = entity.ProfileImage;
                existingUserData.UserDescription = entity.UserDescription;
                existingUserData.UserName = entity.UserName;
                existingUserData.EmailAddress = entity.EmailAddress;
                existingUserData.MobileNo = entity.MobileNo;
                existingUserData.TotalPostCount = entity.TotalPostCount;
                existingUserData.UpdatedBy = entity.UpdatedBy;
                existingUserData.UpdatedAt = DateTime.Now;
                existingUserData.Users = entity.Users;
                existingUserData.CityId = entity.CityId;
                existingUserData.StateId = entity.StateId;
                existingUserData.PincodeId = entity.PincodeId;
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
            var existingUserData = context.UserData.Find(id);

            if (existingUserData != null)
            {
                context.UserData.Remove(existingUserData);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //Get UserData by CityId
        public IEnumerable GetByCityId(long id)
        {
            var userData = context.UserData.Where(x => x.CityId == id && x.IsPublished == true).ToList();
            return userData;
        }

        //Get UserDat by CityName
        public IEnumerable GetByCityName(string name)
        {
            var userData = context.UserData.Include(x => x.City).Where(x => x.City.CityName == name && x.IsPublished == true).ToList();
            return userData;
        }

        //Get UserData by Pincode
        public IEnumerable GetByPincode(long pincode)
        {
            var userData = context.UserData.Include(x => x.Pincode).Where(x => x.Pincode.Pincode1 == pincode && x.IsPublished == true).ToList();
            return userData;
        }

        //Get UserData by StateId
        public IEnumerable GetByStateId(long id)
        {
            var userData = context.UserData.Where(x => x.StateId == id && x.IsPublished == true).ToList();
            return userData;
        }

        //Get UserData by UserName
        public UserData GetByUserName(string name)
        {
            var userData = context.UserData.SingleOrDefault(x => x.UserName == name && x.IsPublished == true);
            return userData;
        }

        //Get UserData by UsersId
        public UserData GetByUsersId(long id)
        {
            var userData = context.UserData.SingleOrDefault(x => x.Users == id && x.IsPublished == true);
            return userData;
        }
    }
}
