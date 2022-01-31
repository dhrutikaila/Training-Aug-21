using RestAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestAPI.EmployeeData
{
    public class SqlEmployeeData : IEmployeeData
    {
        private EmployeeContext _employeeContext;
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
            var ExistingEmployee = _employeeContext.Employees.Find(employee.Id);
            if (ExistingEmployee != null)
            {
                ExistingEmployee.Name = employee.Name;
                _employeeContext.Employees.Update(ExistingEmployee);
                _employeeContext.SaveChanges();
            }
            return employee;
        }
        public Employee GetEmployee(Guid Id)
        {
            var employee=_employeeContext.Employees.Find(Id);
            return employee;
        }

        public List<Employee> GetEmployees()
        {
           return  _employeeContext.Employees.ToList();
        }
    }
}
