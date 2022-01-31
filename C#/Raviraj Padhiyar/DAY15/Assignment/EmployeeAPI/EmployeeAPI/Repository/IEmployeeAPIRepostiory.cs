using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmployeeAPI.Models;

namespace EmployeeAPI.Repository
{
    public interface IEmployeeAPIRepostiory
    {
        bool EmployeeExists(Guid empId);
        IEnumerable<Employee> GetEmployees();
        IEnumerable<Assignment> GetAssignments(Guid empId);
        void AddEmployee(Employee employee);
        bool Save();
        Assignment GetAssignment(Guid empId, Guid assignmentId);


    }
}
