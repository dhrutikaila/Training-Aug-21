using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_15.Models;

namespace Day_15.EmployeeData
{
    public interface IEmployeeData
    {
        List<Employee> GetEmployees();
        Employee GetEmployee(int id);

        Employee AddEmployee(Employee employee);

        void DeleteEmployee(Employee employee);

        Employee EditEmployee(Employee employee);
    }
}
