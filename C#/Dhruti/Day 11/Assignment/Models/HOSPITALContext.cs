using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Hospital_Mange.Models
{
    public partial class HealthCareContext : DbContext
    {
        public HealthCareContext()
        {
        }

        public HealthCareContext(DbContextOptions<HealthCareContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Assistants> Assistants { get; set; }
        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<Departments> Departments { get; set; }
        public virtual DbSet<Doctors> Doctors { get; set; }
        public virtual DbSet<DrugTiming> DrugTiming { get; set; }
        public virtual DbSet<Drug> Drugs { get; set; }
        public virtual DbSet<PatientTakesMedicine> PatientTakesMedicine { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<PatientsPerDoctor> PatientsPerDoctor { get; set; }
        public virtual DbSet<States> States { get; set; }
        public virtual DbSet<Treatment> Treatment { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=HealthCare;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Assistants>(entity =>
            {
                entity.HasKey(e => e.AssistantId)
                    .HasName("Assistants_DoctorId_PkAuto");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.YearsOfExperience).HasColumnType("decimal(3, 1)");

                entity.HasOne(d => d.WorksUnderNavigation)
                    .WithMany(p => p.Assistants)
                    .HasForeignKey(d => d.WorksUnder)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("Assistants_WorksUnder_Fk");
            });

            modelBuilder.Entity<City>(entity =>
            {
                entity.Property(e => e.CityName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.State)
                    .WithMany(p => p.City)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("City_StateId_Fk");
            });

            modelBuilder.Entity<Departments>(entity =>
            {
                entity.HasKey(e => e.DepartmentId)
                    .HasName("Departments_DepartmentId_PkAuto");

                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<Doctors>(entity =>
            {
                entity.HasKey(e => e.DoctorId)
                    .HasName("Doctors_DoctorId_PkAuto");

                entity.Property(e => e.Designation)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.YearsOfExperience).HasColumnType("decimal(3, 1)");

                entity.HasOne(d => d.DepartmentNavigation)
                    .WithMany(p => p.Doctors)
                    .HasForeignKey(d => d.Department)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("Doctors_Department_Fk");
            });

            modelBuilder.Entity<DrugTiming>(entity =>
            {
                entity.HasKey(e => e.TimingId)
                    .HasName("DrugTiming_TimingId_PkAuto");

                entity.Property(e => e.Part)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Drugs>(entity =>
            {
                entity.HasKey(e => e.DrugId)
                    .HasName("Drugs_DrugId_PkAuto");

                entity.Property(e => e.DrugName)
                    .IsRequired()
                    .HasMaxLength(120)
                    .IsUnicode(false);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<PatientTakesMedicine>(entity =>
            {
                entity.Property(e => e.EndDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(dateadd(day,(7),getdate()))");

                entity.Property(e => e.StartDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.AssistantNavigation)
                    .WithMany(p => p.PatientTakesMedicine)
                    .HasForeignKey(d => d.Assistant)
                    .HasConstraintName("PatientTakesMedicine_Assistant_Fk");

                entity.HasOne(d => d.DrugNavigation)
                    .WithMany(p => p.PatientTakesMedicine)
                    .HasForeignKey(d => d.Drug)
                    .HasConstraintName("PatientTakesMedicine_Drug_Fk");

                entity.HasOne(d => d.PatientNavigation)
                    .WithMany(p => p.PatientTakesMedicine)
                    .HasForeignKey(d => d.Patient)
                    .HasConstraintName("PatientTakesMedicine_Patient_Fk");

                entity.HasOne(d => d.TimingNavigation)
                    .WithMany(p => p.PatientTakesMedicine)
                    .HasForeignKey(d => d.Timing)
                    .HasConstraintName("PatientTakesMedicine_Timing_Fk");
            });

            modelBuilder.Entity<Patients>(entity =>
            {
                entity.HasKey(e => e.PatientId)
                    .HasName("Patient_PatientId_PkAuto");

                entity.HasIndex(e => e.ContactNo)
                    .HasName("UQ__Patients__5C667C0564682F54")
                    .IsUnique();

                entity.Property(e => e.ContactNo).HasColumnType("numeric(10, 0)");

                entity.Property(e => e.DateOfBirth).HasColumnType("date");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.CityNavigation)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.City)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Patients__City__31B762FC");
            });

            modelBuilder.Entity<PatientsPerDoctor>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("PatientsPerDoctor");

                entity.Property(e => e.DrName)
                    .IsRequired()
                    .HasMaxLength(61)
                    .IsUnicode(false);

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(61)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<States>(entity =>
            {
                entity.HasKey(e => e.StateId)
                    .HasName("States_StateId_Pk");

                entity.Property(e => e.StateName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Treatment>(entity =>
            {
                entity.Property(e => e.TreatmentDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.AssistantNavigation)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.Assistant)
                    .HasConstraintName("FK__Treatment__Assis__3F115E1A");

                entity.HasOne(d => d.DoctorNavigation)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.Doctor)
                    .HasConstraintName("FK__Treatment__Docto__3D2915A8");

                entity.HasOne(d => d.PatientNavigation)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.Patient)
                    .HasConstraintName("Treatment_Patient_Fk");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}