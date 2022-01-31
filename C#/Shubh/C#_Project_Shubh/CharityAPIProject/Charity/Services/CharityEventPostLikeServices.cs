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
    public class CharityEventPostLikeServices : GenericRepository<CharityEventPostLike>, ICharityEventPostLike
    {
        public CharityEventPostLikeServices(CharityAPIContext context) : base(context)
        {

        }

        //create charityeventpostlike
        public  override bool Create(CharityEventPostLike model)
        {

            var data = context.CharityEventPostLike.SingleOrDefault
                (x => x.CharityEventPostId == model.CharityEventPostId && 
                x.UserId == model.UserId);
            
                
            if (data == null)
            {
                var result = context.CharityEventPostLike.Add(model);
                context.SaveChanges();
                return true;
            }


            else
            {
                return Update(data.CharityEventPostLikeId, model);
            }


        }


        //get all charityeventpostlike 
        public override  IEnumerable<CharityEventPostLike> GetAll()
        {
            var likes = context.CharityEventPostLike.FromSqlRaw("exec getAllPostLike");

            return likes;
        }


        //get postlikedetails by postlike id
        public IEnumerable GetPostLikeDetailsByPostLikeID(long postlikeid)
        {

            var param = new SqlParameter("@postlikeid", postlikeid);
            var cities = context.CharityEventPostLike.FromSqlRaw("exec getAllPostLikeById {0}", param).ToList();

            return cities;
        }

        //get postlike details by usrid

        public IEnumerable GetPostLikeDetailsByUserID(long userid)
        {

            var param = new SqlParameter("@userid", userid);
            var likes = context.CharityEventPostLike.FromSqlRaw("exec getAllPostLikeByUserId {0}", param).ToList();

            return likes;
        }

        //public long GetNumberOfLikesByPostId(long postid)
        //{
        //    var data = context.CharityEventPostLike.Where(x => x.CharityEventPostId = postid).Count(x => x.Likes);
        //    return data;
        //}

        //get number of like by post id

        public long GetNumberOfLikesByPostId(long postid)
        {

            var param = new SqlParameter("@postid", postid);
            var nooflike = context.CharityEventPostLike.FromSqlRaw("exec getNumberOfLike {0}", param);
            var total = Convert.ToInt64(nooflike);

            return total;
        }

        //get number of dislikes by post id


        public long GetNumberOfDisLikesByPostId(long postid)
        {

            var param = new SqlParameter("@postid", postid);
            var noofdislike = context.CharityEventPostLike.FromSqlRaw("exec getNumberOfDisLike {0}", param);
            var total = Convert.ToInt64(noofdislike);

            return total;
        }

        // UPDATE POSTLIKE DETALIS
        public  override bool Update(long id, CharityEventPostLike charityeventpostlike)
        {
            var obj = context.CharityEventPostLike.Find(id);

            if (obj != null)
            {
                //existingcity.CityId = cities.CityId;
                obj.CharityEventPostId = charityeventpostlike.CharityEventPostId;
                obj.Likes = charityeventpostlike.Likes;
                obj.DisLike = charityeventpostlike.DisLike;
                obj.UpdatedBy = charityeventpostlike.UpdatedBy;
                obj.UpdatedAt = DateTime.Now;
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
