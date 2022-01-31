using Day_15_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_15_Assignment.Repository
{
    public interface IAssignment
    {
        Assignment AddAssignment(int EmployeeId, Assignment assignment);
        List<Assignment> GetAssignments(int EmployeeId);
        Assignment GetAssignment(int EmployeeId, int AssignmentId);
        Assignment UpdateAssignment(int EmployeeId, int AssignmentId, Assignment assignment);
    }
}
