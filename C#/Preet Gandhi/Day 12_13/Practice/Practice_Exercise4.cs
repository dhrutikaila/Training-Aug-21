using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Day_12
{
    public class Student_FluAPI_1toM
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public int CurrentGradeId { get; set; }
        public Grade_FluAPI_1toM Grade { get; set; }
    }
    public class Grade_FluAPI_1toM
    {
        public int GradeId { get; set; }
        public string GradeName { get; set; }
        public string Section { get; set; }

        public ICollection<Student_FluAPI_1toM> Students { get; set; }
    }

    public class SchoolContext_FluAPI_1toM : DbContext
    {
        public DbSet<Student_FluAPI_1toM> Student { get; set; }
        public DbSet<Grade_FluAPI_1toM> Grade { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;Database=PracEx3_Day12_C#;Trusted_Connection=True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Student_FluAPI_1toM>()
                .HasOne<Grade_FluAPI_1toM>(s => s.Grade)
                .WithMany(g => g.Students)
                .HasForeignKey(s => s.CurrentGradeId);
        }

        public DbSet<Grade_FluAPI_1toM> Grades { get; set; }
        public DbSet<Student_FluAPI_1toM> Students { get; set; }
    }


    class Practice_Exercise4
    {
        static void Main(string[] args)
        {
                
        }
    }
}
