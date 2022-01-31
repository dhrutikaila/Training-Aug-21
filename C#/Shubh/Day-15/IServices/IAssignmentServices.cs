using Day15.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day15.IServices
{
    public interface IAssignmentServices
    {
        IEnumerable<Assignment> GetAssignments(int employeeId);
        Assignment Get(int assignmentId, int employeeId);
        Assignment AddAssignment(Assignment assignment);
        bool EditAssignment(Assignment assignment);
        bool DeleteAssignment(int assignmentId);
    }
}
