using Day15.Models;
using Day15.IServices;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day15.Services
{
    public class EmployeeServices : IEmployeeServices
    {
        private readonly EmployeeDataContext _context;
        public EmployeeServices(EmployeeDataContext context)
        {
            _context = context;
        }

        public Employee AddEmployee(Employee employee)
        {
            var result = _context.Employee.Add(employee);
            _context.SaveChanges();
            return result.Entity;
        }

        public bool DeleteEmployee(int employeeId)
        {
            var aEmployee = _context.Employee.Find(employeeId);
            if (aEmployee != null)
            {
                aEmployee.IsActive = false;
                _context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool EditEmployee(Employee employee)
        {
            var aEmployee = _context.Employee.Find(employee.EmployeeId);
            if (aEmployee != null)
            {
                _context.Entry(employee).State = EntityState.Modified;
                _context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public Employee Get(int employeeId)
        {
            return _context.Employee.Find(employeeId);
        }


        public IEnumerable<Employee> GetEmployees()
        {
            return _context.Employee.Include(a=>a.Assignment).ToList();
        }

    }
}
