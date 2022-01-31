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
    public class SpamServices : GenericRepository<Spam>, ISpam
    {
        public SpamServices(CharityAPIContext context) : base(context)
        {

        }

        //create spam
        public override bool Create(Spam spam)
        {
            var result = context.Spam.Add(spam);
            context.SaveChanges();
            return true;
        }

        //get all spam 
        public override IEnumerable<Spam> GetAll()
        {
            var spam = context.Spam.FromSqlRaw("exec getAllSpam").ToList();

            return spam;
        }

        //get spam by spam id
        public IEnumerable GetSpamById(long id)
        {

            var param = new SqlParameter("@spamid", id);
            var spam = context.Urgency.FromSqlRaw("exec getSpamBySpamId {0}", param).ToList();

            return spam;
        }

        //get spam by post id
        public IEnumerable GetSpamByPostId(long postid)
        {

            var param = new SqlParameter("@postid", postid);
            var spam = context.Spam.FromSqlRaw("exec getSpamByPostId {0}", param).ToList();

            return spam;
        }

        //get spam by user id
        public IEnumerable GetSpamByUserId(long userid)
        {

            var param = new SqlParameter("@userid", userid);
            var spam = context.Spam.FromSqlRaw("exec getSpamByUserId {0}", param).ToList();

            return spam;
        }

        //update spam
        public override bool Update(long id, Spam spam)
        {
            var existingspam= context.Spam.Find(id);

            if (existingspam != null)
            {

                existingspam.PostId = spam.PostId;
                existingspam.UserId = spam.UserId;
                existingspam.UpdatedBy = spam.UpdatedBy;
                existingspam.UpdatedAt = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }

        }

        //delete spam

        public override bool Delete(long id)
        {
            var existingspam = context.Spam.Find(id);

            if (existingspam != null)
            {
                context.Spam.Remove(existingspam);
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
