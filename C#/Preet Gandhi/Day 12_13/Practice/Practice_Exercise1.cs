//https://www.entityframeworktutorial.net/efcore/one-to-one-conventions-entity-framework-core.aspx

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Day_12
{
    //One to one Relationship
    public class Student_1to1
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public StudentAddress_1to1 Address { get; set; }
    }
    public class StudentAddress_1to1
    {
        public int StudentAddressId { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }

        public int StudentId { get; set; }
        public Student_1to1 Student { get; set; }
    }
    public class SchoolContext_1to1 : DbContext
    {
        public DbSet<Student_1to1> Student { get; set; }
        public DbSet<StudentAddress_1to1> StudentAddress { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS;Database=PracEx1_Day12_C#;Trusted_Connection=True;");
        }
    }
    

    
    class Practice_Exercise1
    {
        static void Main(string[] args)
        {
        }
    }
}
