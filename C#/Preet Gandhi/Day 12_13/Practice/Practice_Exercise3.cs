using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Day_12
{
    public class Student_FluAPI_1to1
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public StudentAddress_FluAPI_1to1 Address { get; set; }
    }

    public class StudentAddress_FluAPI_1to1
    {
        public int StudentAddressId { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }

        public int AddressOfStudentId { get; set; }
        public Student_FluAPI_1to1 Student { get; set; }
    }

    public class SchoolContext_FluAPI_1to1 : DbContext
    {
        public DbSet<Student_FluAPI_1to1> Student { get; set; }
        public DbSet<StudentAddress_FluAPI_1to1> StudentAddress { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;Database=EFCore-SchoolDB;Trusted_Connection=True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Student_FluAPI_1to1>()
                .HasOne<StudentAddress_FluAPI_1to1>(s => s.Address)
                .WithOne(ad => ad.Student)
                .HasForeignKey<StudentAddress_FluAPI_1to1>(ad => ad.AddressOfStudentId);
        }

        public DbSet<Student_FluAPI_1to1> Students { get; set; }
        public DbSet<StudentAddress_FluAPI_1to1> StudentAddresses { get; set; }
    }
    class Practice_Exercise3
    {
        static void Main(string[] args)
        {

        }
    }
}
