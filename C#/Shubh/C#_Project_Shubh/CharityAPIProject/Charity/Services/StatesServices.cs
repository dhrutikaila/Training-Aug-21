using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class StatesServices : GenericRepository<States>, IStates
    {
        public StatesServices(CharityAPIContext context) : base(context)
        {

        }

        //create state
        public override bool Create(States states)
        {
            var result = context.States.Add(states);
            context.SaveChanges();
            return true;
            
            
            
            //string StoredProc = "exec addState " +
            //    "@sname = '" + states.StateName + "'," +
            //    "@cby = '" + states.CreatedBy + "'," +
            //    "@cat= '" + states.CreatedAt + "'," +
            //    "@uby= '" + states.UpdatedBy + "'," +
            //    "@uat= '" + states.UpdatedAt + "'," + "'";
            //context.States.FromSqlRaw(StoredProc);
            //context.SaveChanges();
            //return true;

        }

        //get all states 
        public override IEnumerable<States> GetAll()
        {
            var state = context.States.FromSqlRaw("exec getAllState").ToList();

            return state;
        }

        //get state by state id
        public IEnumerable<States> GetStateById(long id)
        {

            var param = new SqlParameter("@stateid", id);
            var state = context.States.FromSqlRaw("exec getStateByStateId {0}", param).ToList();

            return state;
        }

        //get state by state name
        public IEnumerable GetStateByStateName(string sname)
        {

            var param = new SqlParameter("@statename", sname);
            var state = context.States.FromSqlRaw("exec getStateByStateName {0}", param).ToList();

            return state;
        }


        //update state

        public override bool Update(long id, States states)
        {
            var existingstate = context.States.Find(id);

            if (existingstate != null)
            {
                //existingstate.StateId = entity.StateId;
                existingstate.StateName = states.StateName;
                existingstate.UpdatedBy = states.UpdatedBy;
                existingstate.UpdatedAt = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }

        }

        //delete state

        public override bool Delete(long id)
        {
            var existingstate = context.States.Find(id);

            if (existingstate != null)
            {
                context.States.Remove(existingstate);
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
