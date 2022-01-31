using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.NewtonsoftJson;
using System.Drawing;
using System.IO;

namespace CharityAPI.Services
{
    public class PostServices : GenericRepository<Post>, IPost
    {
        public PostServices(CharityAPIContext context) : base(context)
        {

        }

        // Create Post
        public bool Create(Post post, Image file, string fileName)
        {
            if (file != null)
            {
                var p = context.Post.Add(post);
                var commonHelper = new CommonHelper();
                context.SaveChanges();


                var imagepath = commonHelper.GetPostPath(post.UserId,post.PostId);

                // Create directory Path if not Exit
                commonHelper.CreateDirectory(imagepath);
                var imageFileName = Path.GetFileName(post.ImageUrl);

                if (!string.IsNullOrEmpty(imageFileName) && imageFileName.Contains("?t="))
                {
                    imageFileName = imageFileName.Split('?')[0].ToString();
                }
                if (!string.IsNullOrEmpty(imageFileName))
                {
                    // Delete file path if exit
                    commonHelper.DeleteFilePath(imagepath, imageFileName);
                }
                post.ImageUrl = fileName;
                var fileSavePath = Path.Combine(imagepath, fileName);
                file.Save(fileSavePath);

                return true;
            }
            else
            {
                return false;
            }
        }

        // Update Post
        public bool Update(long id, Post entity, Image file)
        {           
            var existingPost = context.Post.Find(id);

            if(existingPost!= null)
            {
                if (file != null)
                {
                    var commonHelper = new CommonHelper();
                    var imagepath = commonHelper.GetPostPath(entity.UserId, entity.PostId);

                    commonHelper.CreateDirectory(imagepath);
                    var imageFileName = Path.GetFileName(entity.ImageUrl);
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
                    var fileSavePath = Path.Combine(imagepath, entity.ImageUrl);
                    file.Save(fileSavePath);
                }
                existingPost.ClusterLocations = entity.ClusterLocations;
                existingPost.LocationName = entity.LocationName;
                existingPost.Pincode = entity.Pincode;
                existingPost.PincodeId = entity.PincodeId;
                existingPost.PostDescription = entity.PostDescription;
                existingPost.RequirementType = entity.RequirementType;
                existingPost.RequirementTypeId = entity.RequirementTypeId;
                existingPost.Latitude = entity.Latitude;
                existingPost.HelpRequiredCount = entity.HelpRequiredCount;
                existingPost.Urgency = entity.Urgency;
                existingPost.Spam = entity.Spam;
                existingPost.UpdatedBy = entity.UpdatedBy;
                existingPost.UpdatedAt = DateTime.Now;
                existingPost.CloseAt = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        // Delete Post
        public override bool Delete(long id)
        {
            var existingPost = context.Post.Find(id);

            if (existingPost != null)
            {
                context.Post.Remove(existingPost);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        // Get Post by PostId
        public IEnumerable GetById(long id)
        {
            var post = context.Post.Where(x => x.PostId == id && x.IsPublished == true).ToList();
            return post;
        }
        
        //Get Post by UserName
        public IEnumerable GetPostByUserName(string name)
        {
            
            var post = context.Post.Include(x => x.User).Where(x => x.User.UserName == name && x.IsPublished == true);
            return post;
        }

        // Get Post by UserId
        public IEnumerable GetPostByUserId(long id)
        {
            var post = context.Post.Where(x => x.UserId == id && x.IsPublished == true).ToList();
            return post;
        }

        // Get Post by PincodeId
        public IEnumerable GetPostByPincodeId(long id)
        {
            var post = context.Post.Where(x => x.PincodeId == id && x.IsPublished == true).ToList();
            return post;
        }

        // Get Post by Pincode
        public IEnumerable GetPostByPincode(long id)
        {
            var post = context.Post.Include(x => x.Pincode).Where(x => x.Pincode.Pincode1 == id && x.IsPublished == true).ToList();
            return post;
        }

        // Get Post by CityId
        public IEnumerable GetPostByCity(long id)
        {
            var post = context.Post.Where(x => x.CityId == id && x.IsPublished == true).ToList();
            return post;
        }

        // Get Post by StateId
        public IEnumerable GetPostByState(long id)
        {
            var post = context.Post.Where(x => x.StateId == id && x.IsPublished == true).ToList();
            return post;
        }
        
        // Get Post by LocationName
        public IEnumerable GetPostByLocation(string name)
        {
            var post = context.Post.Where(x => x.LocationName == name && x.IsPublished == true).ToList();
            return post;
        }

        // Get Post by RequirementTypeId
        public IEnumerable GetPostByRequirement(long id)
        {
            var post = context.Post.Where(x => x.RequirementTypeId == id && x.IsPublished == true).ToList();
            return post;
        }     


        // Get Post by TimeRange
        public IEnumerable GetPostByDate(DateTime date)
        {            
            var post = context.Post.Where(x => x.CreatedAt <= date.Date && x.IsClosed == false && x.IsPublished == true).ToList();
            return post;
        }

    }
}
