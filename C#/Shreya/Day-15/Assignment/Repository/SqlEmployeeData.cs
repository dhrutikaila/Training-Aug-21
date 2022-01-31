using Day_15_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_15_Assignment.Repository
{
    public class SqlEmployeeData : IEmployee
    {
        private readonly EmployeeDbContext _employeeDbContext;
        public SqlEmployeeData(EmployeeDbContext employeeDbContext)
        {
            _employeeDbContext = employeeDbContext;
        }
        public Employee AddEmployee(Employee employee)
        {
            _employeeDbContext.Employees.Add(employee);
            _employeeDbContext.SaveChanges();
            return employee;
        }

        public void DeleteEmployee(Employee employee)
        {
            _employeeDbContext.Employees.Remove(employee);
            _employeeDbContext.SaveChanges();
        }

        public Employee GetEmployee(int id)
        {
            var employee = _employeeDbContext.Employees.Find(id);
            return employee;
        }

        public List<Employee> GetEmployees()
        {
            return _employeeDbContext.Employees.ToList();
        }

        public Employee UpdateEmployee(Employee employee)
        {
            var ExistingEmployee = _employeeDbContext.Employees.Find(employee.EmployeeId);
            if (ExistingEmployee != null)
            {
                ExistingEmployee.FirstName = employee.FirstName;
                ExistingEmployee.Country = employee.Country;
                _employeeDbContext.Employees.Update(ExistingEmployee);
                _employeeDbContext.SaveChanges();
            }
            return employee;
        }

        Employee IEmployee.DeleteEmployee(Employee employee)
        {
            throw new NotImplementedException();
        }
    }
}
