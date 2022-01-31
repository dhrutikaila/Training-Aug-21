using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class RequirementTypeServices: GenericRepository<RequirementType>, IRequirementType
    {
        public RequirementTypeServices(CharityAPIContext context) : base(context)
        {

        }
        public override bool Create(RequirementType requirementType)
        {
            var result = context.RequirementType.Add(requirementType);
            context.SaveChanges();
            return true;
        }

        // Update event type
        public override bool Update(long id, RequirementType entity)
        {
            var existingReqType = context.RequirementType.Find(id);

            if (existingReqType != null)
            {
                existingReqType.RequirementTypeName = entity.RequirementTypeName;
                existingReqType.UpdatedBy = entity.UpdatedBy;
                existingReqType.UpdatedAt = DateTime.Now;
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
            var existingReqType = context.RequirementType.Find(id);

            if (existingReqType != null)
            {
                context.RequirementType.Remove(existingReqType);
                context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
            //var eventType = context.RequirementType
            //    .Where(s => s.RequirementTypeId == id)
            //    .SingleOrDefault();

            
            //const string query = "DELETE FROM [dbo].[Customers] WHERE [id]={0}";
            //var rows = context.Database.ExecuteSqlCommand(query, id);
            // rows >= 1 - count of deleted rows,
            // rows = 0 - nothing to delete.

        }
    }
}
