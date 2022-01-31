using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Day_12
{
    //One to Many Relationship
    public class Student_1toM
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public int GradeId { get; set; }
        public Grade_1toM Grade { get; set; }
    }

    public class Grade_1toM
    {
        public int GradeId { get; set; }
        public string GradeName { get; set; }

        public ICollection<Student_1toM> Students { get; set; }
    }
    public class SchoolContext_1to2 : DbContext
    {
        public DbSet<Student_1toM> Student { get; set; }
        public DbSet<Grade_1toM> Grade { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS;Database=PracEx1_Day12_C#;Trusted_Connection=True;");
        }
    }
    class Practice_Exercise2
    {
        static void Main(string[] args)
        {

        }
    }
}
