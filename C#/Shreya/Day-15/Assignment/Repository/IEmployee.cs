using Day_15_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_15_Assignment.Repository
{
    public interface IEmployee
    {
        List<Employee> GetEmployees();
        Employee GetEmployee(int id);
        Employee AddEmployee(Employee employee);
        Employee DeleteEmployee(Employee employee);
        Employee UpdateEmployee(Employee employee);

    }
}
