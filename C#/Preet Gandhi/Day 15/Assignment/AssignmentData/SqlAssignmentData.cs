using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_15.Models;

namespace Day_15.AssignmentData
{
    public class SqlAssignmentData : IAssignmentData
    {
        private readonly EmpAssignmentContext _empAssignmentContext;
        public SqlAssignmentData(EmpAssignmentContext empAssignmentContext)
        {
            _empAssignmentContext = empAssignmentContext;
        }
        //public Assignment AddAssignment(Assignment assignment)
        //{
        //    _empAssignmentContext.Assignments.Add(assignment);
        //    _empAssignmentContext.SaveChanges();
        //    return assignment;
        //}

        public void DeleteAssignment(Assignment assignment)
        {
            _empAssignmentContext.Assignments.Remove(assignment);
            _empAssignmentContext.SaveChanges();
        }

        public Assignment EditAssignment(Assignment assignment)
        {
            var existingAssignment = _empAssignmentContext.Assignments.Find(assignment.AssignmentId);

            if (existingAssignment != null)
            {
                existingAssignment.AssignmentName = assignment.AssignmentName;
                existingAssignment.DepartmentId = assignment.DepartmentId;

                _empAssignmentContext.Assignments.Update(existingAssignment);
                _empAssignmentContext.SaveChanges();
            }
            return assignment;
        }

        public Assignment GetAssignment(int assignmentid, int employeeid)
        {
            var assignment = _empAssignmentContext.Assignments.Where(a => a.EmployeeId == employeeid && a.AssignmentId == assignmentid).FirstOrDefault();
            return assignment;
        }

        public List<Assignment> GetAssignments(int employeeid)
        {
            return _empAssignmentContext.Assignments.Where(a => a.EmployeeId == employeeid).ToList();
        }
    }
}
