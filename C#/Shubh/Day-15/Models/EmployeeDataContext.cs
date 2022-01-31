using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day15.Models
{
    public partial class EmployeeDataContext : DbContext
    {
        //Scaffold-DbContext "Server=.\SQLEXPRESS;database=EmployeeData;User ID=dd;Password=12345;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -force
        public EmployeeDataContext()
        {
        }

        public EmployeeDataContext(DbContextOptions<EmployeeDataContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Assignment> Assignment { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }

//        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
//                optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;database=EmployeeData;User ID=dd;Password=12345;");
//            }
//        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Assignment>(entity =>
            {
                entity.Property(e => e.ActionCode).HasMaxLength(30);

                entity.Property(e => e.ActionReasonCode).HasMaxLength(30);

                entity.Property(e => e.ActualTerminationDate).HasColumnType("date");

                entity.Property(e => e.AssignmentCategory).HasMaxLength(30);

                entity.Property(e => e.AssignmentName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.AssignmentNumber).HasMaxLength(30);

                entity.Property(e => e.AssignmentProjectedEndDate).HasColumnType("date");

                entity.Property(e => e.AssignmentStatus).HasMaxLength(30);

                entity.Property(e => e.CreationDate).HasColumnType("datetime");

                entity.Property(e => e.DefaultExpenseAccount).HasMaxLength(30);

                entity.Property(e => e.EffectiveEndDate).HasColumnType("date");

                entity.Property(e => e.EffectiveStartDate).HasColumnType("date");

                entity.Property(e => e.EndTime).HasMaxLength(30);

                entity.Property(e => e.Frequency).HasMaxLength(30);

                entity.Property(e => e.FullPartTime).HasMaxLength(30);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.LastUpdateDate).HasColumnType("datetime");

                entity.HasOne(d => d.Manager)
                    .WithMany(p => p.Assignment)
                    .HasForeignKey(d => d.ManagerId)
                    .HasConstraintName("FK_EmpAssignment");
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.Property(e => e.AddressLine1).HasMaxLength(30);

                entity.Property(e => e.AddressLine2).HasMaxLength(30);

                entity.Property(e => e.AddressLine3).HasMaxLength(30);

                entity.Property(e => e.CitizenshipLegislationCode).HasMaxLength(30);

                entity.Property(e => e.CitizenshipStatus).HasMaxLength(30);

                entity.Property(e => e.CitizenshipToDate).HasColumnType("date");

                entity.Property(e => e.City).HasMaxLength(30);

                entity.Property(e => e.CorrespondenceLanguage).HasMaxLength(30);

                entity.Property(e => e.Country).HasMaxLength(30);

                entity.Property(e => e.CreationDate).HasColumnType("datetime");

                entity.Property(e => e.DateOfBirth).HasColumnType("date");

                entity.Property(e => e.DisplayName).HasMaxLength(30);

                entity.Property(e => e.DriversLicenseExpirationDate).HasColumnType("date");

                entity.Property(e => e.DriversLicenseId).HasMaxLength(30);

                entity.Property(e => e.DriversLicenseIssuingCountry).HasMaxLength(30);

                entity.Property(e => e.EffectiveStartDate).HasColumnType("date");

                entity.Property(e => e.EmployeeName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.Ethnicity).HasMaxLength(30);

                entity.Property(e => e.Gender).HasMaxLength(30);

                entity.Property(e => e.HireDate).HasColumnType("date");

                entity.Property(e => e.HomeFaxAreaCode).HasMaxLength(30);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
