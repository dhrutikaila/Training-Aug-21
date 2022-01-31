using RestAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestAPI.EmployeeData
{
   public  interface IEmployeeData
    {
        //for getting data
        List<Employee> GetEmployees();

        //fetch by id
        Employee GetEmployee(Guid Id);

        //Add employee
        Employee AddEmployee(Employee employee);

        //Delete employee
        void DeleteEmployee(Employee employee);

        //update employee
        Employee EditEmployee(Employee employee);
    }
}
