//https://www.entityframeworktutorial.net/efcore/entity-framework-core-console-application.aspx

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;

namespace Day_11
{
    public class Student
    {
        public int StudentId { get; set; }
        public string Name { get; set; }
    }
    public class Course
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
    }

    public class SchoolContext : DbContext
    {
        public DbSet<Student> Students { get; set; }
        public DbSet<Course> Courses { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS;Database=PracEx1_Day11_C#;Trusted_Connection=True;");
        }

    }

    public class Practice_Exercise1
    {
        static void Main(string[] args)
        {
            using (var context = new SchoolContext())
            {
                var std = new Student()
                {
                    Name = "Hiren"
                };
                context.Students.Add(std);
                context.SaveChanges();
            }
        }
    }
}
