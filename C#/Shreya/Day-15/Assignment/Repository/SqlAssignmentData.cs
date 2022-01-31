using Day_15_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_15_Assignment.Repository
{
    public class SqlAssignmentData : IAssignment
    {
        private readonly EmployeeDbContext _employeeDbContext;
        public SqlAssignmentData(EmployeeDbContext employeeDbContext)
        {
            _employeeDbContext = employeeDbContext;
        }
        public Assignment AddAssignment(int EmployeeId, Assignment assignment)
        {

            assignment.EmployeesId = EmployeeId;
            _employeeDbContext.Assignments.Add(assignment);
            _employeeDbContext.SaveChanges();
            return assignment;
        }
        public Assignment GetAssignment(int EmployeeId, int AssignmentId)
        {
            var assignment = _employeeDbContext.Assignments
                            .SingleOrDefault(op => op.EmployeesId == EmployeeId && op.AssignmentId == AssignmentId);
            return assignment;
        }
        public List<Assignment> GetAssignments(int EmployeeId)
        {
            var assignment = _employeeDbContext.Assignments
                                 .Where(op => op.EmployeesId == EmployeeId).ToList();
            return assignment;
        }
        public Assignment UpdateAssignment(int EmployeeId, int AssignmentId, Assignment assignment)
        {
            var Existingassignment = _employeeDbContext.Assignments
                            .SingleOrDefault(op => op.EmployeesId == EmployeeId && op.AssignmentId == AssignmentId);
            if(Existingassignment != null)
            {
                Existingassignment.ActionCode = assignment.ActionCode;
                Existingassignment.AssignmentName = assignment.AssignmentName;
            }
            _employeeDbContext.SaveChanges();
            return assignment;
        }
    }
}
