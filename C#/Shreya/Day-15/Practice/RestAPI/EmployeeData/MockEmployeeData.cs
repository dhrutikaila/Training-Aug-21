using RestAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace RestAPI.EmployeeData
{
    public class MockEmployeeData : IEmployeeData
    {
        private List<Employee> employees = new List<Employee>() {
                new Employee()
                {
                    Id = Guid.NewGuid(),
                    Name = "Shreya" 
                },
                 new Employee()
                {
                    Id = Guid.NewGuid(),
                    Name = "Diya"
                }
        };

        public Employee AddEmployee(Employee employee)
        {
            employee.Id = Guid.NewGuid();
            employees.Add(employee);
            return employee;
        }

        public void DeleteEmployee(Employee employee)
        {
            employees.Remove(employee);
        }

        public Employee EditEmployee(Employee employee)
        {
            var existingEmployee = GetEmployee(employee.Id);
            existingEmployee.Name = employee.Name;
            return employee;
        }

        public Employee GetEmployee(Guid Id)
        {
            return employees.SingleOrDefault(x => x.Id == Id);
        }

        public List<Employee> GetEmployees()
        {
            return employees;
        }
    }
}
