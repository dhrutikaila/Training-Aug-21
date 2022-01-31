using Day15.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day15.IServices
{
    public interface IEmployeeServices
    {
        IEnumerable<Employee> GetEmployees();
        Employee Get(int employeeId);
        Employee AddEmployee(Employee employee);
        bool EditEmployee(Employee employee);
        bool DeleteEmployee(int employeeId);
    }
}
