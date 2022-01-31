using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Day_15.Models
{
    public class EmpAssignmentContext : DbContext
    {
        public EmpAssignmentContext(DbContextOptions<EmpAssignmentContext> options) : base(options)
        {

        }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Assignment> Assignments { get; set; }
    }
}
