using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_15.Models;

namespace Day_15.EmployeeData
{
    public class SqlEmployeeData : IEmployeeData
    {
        private readonly EmpAssignmentContext _empAssignmentContext;
        public SqlEmployeeData(EmpAssignmentContext empAssignmentContext)
        {
            _empAssignmentContext = empAssignmentContext;
        }

        public Employee AddEmployee(Employee employee)
        {
            _empAssignmentContext.Employees.Add(employee);
            _empAssignmentContext.SaveChanges();
            return employee;
        }

        public void DeleteEmployee(Employee employee)
        {
            _empAssignmentContext.Employees.Remove(employee);
            _empAssignmentContext.SaveChanges();
        }

        public Employee EditEmployee(Employee employee)
        {
            var existingEmployee = _empAssignmentContext.Employees.Find(employee.EmployeeId);

            if (existingEmployee != null)
            {
                existingEmployee.FirstName = employee.FirstName;
                existingEmployee.LastName = employee.LastName;
                _empAssignmentContext.Employees.Update(existingEmployee);
                _empAssignmentContext.SaveChanges();
            }
            return employee;
        }

        public Employee GetEmployee(int id)
        {
            var employee = _empAssignmentContext.Employees.Find(id);
            return employee;
        }

        public List<Employee> GetEmployees()
        {
            return _empAssignmentContext.Employees.ToList();
        }
    }
}
