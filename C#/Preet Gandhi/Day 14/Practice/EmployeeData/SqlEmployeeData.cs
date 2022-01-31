using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day14_Assignment1.Models;

namespace Day14_Assignment1.EmployeeData
{
    public class SqlEmployeeData : IEmployeeData
    {
        private readonly EmployeeContext _employeeContext;
        public SqlEmployeeData(EmployeeContext employeeContext)
        {
            _employeeContext = employeeContext;
        }
        public Employee AddEmployee(Employee employee)
        {
            employee.Id = Guid.NewGuid();
            _employeeContext.Employees.Add(employee);
            _employeeContext.SaveChanges();
            return employee;
        }

        public void DeleteEmployee(Employee employee)
        {
            _employeeContext.Employees.Remove(employee);
            _employeeContext.SaveChanges();
        }

        public Employee EditEmployee(Employee employee)
        {
            var existingEmployee = _employeeContext.Employees.Find(employee.Id);

            if(existingEmployee != null)
            {
                existingEmployee.Name = employee.Name;
                _employeeContext.Employees.Update(existingEmployee);
                _employeeContext.SaveChanges();
            }
            return employee;
        }

        public Employee GetEmployee(Guid id)
        {
            //return _employeeContext.Employees.SingleOrDefault(x => x.Id == id);
            var employee = _employeeContext.Employees.Find(id);
            return employee;
        }

        public List<Employee> GetEmployees()
        {
            return _employeeContext.Employees.ToList();
        }
    }
}
