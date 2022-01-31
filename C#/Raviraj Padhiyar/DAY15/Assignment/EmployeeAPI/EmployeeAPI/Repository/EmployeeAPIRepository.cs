using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmployeeAPI.Models;

namespace EmployeeAPI.Repository
{
    public class EmployeeAPIRepository : IEmployeeAPIRepostiory
    {
        private readonly EmployeeDbContext _context;

        public EmployeeAPIRepository(EmployeeDbContext context)
        {
            _context = context ??
                throw new ArgumentException(nameof(context));
        }

        public void AddEmployee(Employee employee)
        {
            if(employee == null)
            {
                throw new ArgumentException(nameof(employee));
            }

            employee.Id = Guid.NewGuid();

            foreach (var assignment in employee.Assignments)
            {
                assignment.Id = Guid.NewGuid();
            }

            _context.Employees.Add(employee);
        }

        public bool EmployeeExists(Guid empId)
        {
            if(empId == Guid.Empty)
            {
                throw new ArgumentNullException(nameof(empId));
            }

            return _context.Employees.Any(e => e.Id == empId);
        }

        public IEnumerable<Assignment> GetAssignments(Guid empId)
        {
            if (empId == Guid.Empty)
            {
                throw new ArgumentNullException(nameof(empId));
            }

            return _context.Assignments
                .Where(a => a.EmployeeId == empId)
                .ToList<Assignment>();
                
        }

        public Assignment GetAssignment(Guid empId, Guid assignmentId)
        {
            if(empId == Guid.Empty)
            {
                throw new ArgumentNullException(nameof(empId));
            }

            if(assignmentId == Guid.Empty)
            {
                throw new ArgumentNullException(nameof(assignmentId));
            }

            return _context.Assignments
                .Where(a => a.EmployeeId == empId)
                .Where(a => a.Id == assignmentId)
                .FirstOrDefault();
        }

        public IEnumerable<Employee> GetEmployees()
        {
            return _context.Employees.ToList<Employee>();
        }

        public bool Save()
        {
            return (_context.SaveChanges() >= 0);
        }
    }
}
