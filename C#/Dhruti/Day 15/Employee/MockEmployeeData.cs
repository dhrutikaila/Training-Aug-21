using EmployeeData.Models;
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
                    Name = "DHRUTI"
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

        public Employee EditEmployee(Employee Employee)
        {
            var existingEmployee = GetEmployee((Guid)Employee.Id);
            existingEmployee.Name = Employee.Name;
            return Employee;
        }

        public Employee GetEmployee(Guid Id)
        {
            return employees.SingleOrDefault(x => x.id == Id);
        }

        public List<Employee> GetEmployees()
        {
            return employees;
        }
    }
}