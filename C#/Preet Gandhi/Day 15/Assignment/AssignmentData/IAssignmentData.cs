using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_15.Models;

namespace Day_15.AssignmentData
{
    public interface IAssignmentData
    {
        List<Assignment> GetAssignments(int employeeid);
        Assignment GetAssignment(int assignmentid, int employeeid);

        //Assignment AddAssignment(Assignment assignment);

        void DeleteAssignment(Assignment assignment);

        Assignment EditAssignment(Assignment assignment);
    }
}