using System;
using Day17.Authentication;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day17.Models
{
    public partial class HealthCareJWTContext : IdentityDbContext<ApplicationUser>
    {
        //instance-Scaffold-DbContext "Server=.\SQLEXPRESS;database=HealthCareJWT;User ID=dd;Password=12345;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -force
        public HealthCareJWTContext()
        {
        }

        public HealthCareJWTContext(DbContextOptions<HealthCareJWTContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Assistant> Assistant { get; set; }
        public virtual DbSet<Department> Department { get; set; }
        public virtual DbSet<Doctor> Doctor { get; set; }
        public virtual DbSet<MedicineTime> MedicineTime { get; set; }
        public virtual DbSet<Medicines> Medicines { get; set; }
        public virtual DbSet<Patient> Patient { get; set; }
        public virtual DbSet<Prescribed> Prescribed { get; set; }
        public virtual DbSet<Treatment> Treatment { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;database=HealthCareJWT;User ID=dd;Password=12345;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Assistant>(entity =>
            {
                entity.Property(e => e.AssistantFirstName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.AssistantLastName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.AssistDepartment)
                    .WithMany(p => p.Assistant)
                    .HasForeignKey(d => d.AssistDepartmentId)
                    .HasConstraintName("FK_AssistDept");

                entity.HasOne(d => d.AssistDoctor)
                    .WithMany(p => p.Assistant)
                    .HasForeignKey(d => d.AssistDoctorId)
                    .HasConstraintName("FK_AssistDocor");
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<Doctor>(entity =>
            {
                entity.Property(e => e.DoctorFirstName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.DoctorLastName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.DocDepartment)
                    .WithMany(p => p.Doctor)
                    .HasForeignKey(d => d.DocDepartmentId)
                    .HasConstraintName("FK_DocorDept");
            });

            modelBuilder.Entity<MedicineTime>(entity =>
            {
                entity.Property(e => e.InMorning).HasDefaultValueSql("((0))");

                entity.Property(e => e.InNight).HasDefaultValueSql("((0))");

                entity.Property(e => e.InNoon).HasDefaultValueSql("((0))");

                entity.Property(e => e.MedicineTake)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.Medicine)
                    .WithMany(p => p.MedicineTime)
                    .HasForeignKey(d => d.MedicineId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MedicineTime");
            });

            modelBuilder.Entity<Medicines>(entity =>
            {
                entity.HasKey(e => e.MedicineId)
                    .HasName("PK__Medicine__4F212890F0206D74");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.MedicineName)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<Patient>(entity =>
            {
                entity.HasIndex(e => e.MobileNo)
                    .HasName("UQ__Patient__D6D73A86175B6CAD")
                    .IsUnique();

                entity.Property(e => e.Dob)
                    .HasColumnName("DOB")
                    .HasColumnType("date");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.PatientFirstName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.PatientLastName)
                    .IsRequired()
                    .HasMaxLength(30);
            });

            modelBuilder.Entity<Prescribed>(entity =>
            {
                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.MedicineTimeId)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.PrescibedDate).HasColumnType("date");

                entity.HasOne(d => d.Treatment)
                    .WithMany(p => p.Prescribed)
                    .HasForeignKey(d => d.TreatmentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TreatPrescribed");
            });

            modelBuilder.Entity<Treatment>(entity =>
            {
                entity.Property(e => e.AdmitDate).HasColumnType("date");

                entity.Property(e => e.AssistantId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DischargeDate).HasColumnType("date");

                entity.Property(e => e.DiseaseName)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TreatDoctor");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TreatPatient");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
