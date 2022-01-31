using Day15.IServices;
using Day15.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day15.Services
{
    public class AssignmentServices : IAssignmentServices
    {
        private readonly EmployeeDataContext _context;
        public AssignmentServices(EmployeeDataContext context)
        {
            _context = context;
        }

        public Assignment AddAssignment(Assignment assignment)
        {
            var result = _context.Assignment.Add(assignment);
            _context.SaveChanges();
            return result.Entity;
        }


        public bool DeleteAssignment(int assignmentId)
        {
            var aAssignment = _context.Assignment.Find(assignmentId);
            if (aAssignment != null)
            {
                aAssignment.IsActive = false;
                _context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        

        public bool EditAssignment(Assignment assignment)
        {
            var aAssignment=_context.Assignment.Find(assignment.AssignmentId);
            if (aAssignment != null)
            {
                _context.Entry(assignment).State = EntityState.Modified;
                _context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public IEnumerable<Assignment> GetAssignments(int employeeId)
        {
            return _context.Assignment.Where(a=>a.ManagerId==employeeId).ToList();
        }


        Assignment IAssignmentServices.Get(int assignmentId, int employeeId)
        {
            return _context.Assignment.Where(a=>a.AssignmentId==assignmentId && a.ManagerId==employeeId).FirstOrDefault();
            
        }
    }
}
