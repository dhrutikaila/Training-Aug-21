using System;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
#nullable disable
namespace Day_17Assignment.Models
{
    public partial class HealthCareDbContext : IdentityDbContext<ApplicationUser>
    {
        public HealthCareDbContext(DbContextOptions<HealthCareDbContext> options)
            : base(options)
        {
        }
        public DbSet<ApplicationUser> applicationUsers { get; set; }
        public virtual DbSet<Assistance> Assistances { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<Drug> Drugs { get; set; }
        public virtual DbSet<DrugsSchedule> DrugsSchedules { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<PatientDoctorReport> PatientDoctorReports { get; set; }
        public virtual DbSet<PatientReport> PatientReports { get; set; }
        public virtual DbSet<SummaryReport> SummaryReports { get; set; }
        public virtual DbSet<TreatMent> TreatMents { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Assistance>(entity =>
            {
                entity.ToTable("Assistance");

                entity.Property(e => e.AssistanceName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Assistances)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("Department_fkForeig");
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.ToTable("Department");

                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Doctor>(entity =>
            {
                entity.ToTable("Doctor");

                entity.Property(e => e.DoctorName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Doctors)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("Doctor_fkForeig");
            });

            modelBuilder.Entity<Drug>(entity =>
            {
                entity.Property(e => e.DrugName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Parts)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<DrugsSchedule>(entity =>
            {
                entity.ToTable("DrugsSchedule");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DrugsSchedules)
                    .HasForeignKey(d => d.DoctorId)
                    .HasConstraintName("DoctorId_fkForeign");

                entity.HasOne(d => d.Drug)
                    .WithMany(p => p.DrugsSchedules)
                    .HasForeignKey(d => d.DrugId)
                    .HasConstraintName("drug_fkForeig");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.DrugsSchedules)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("PatientId_fkForeig");
            });

            modelBuilder.Entity<Patient>(entity =>
            {
                entity.ToTable("Patient");

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.Assistance)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.AssistanceId)
                    .HasConstraintName("Assistance_fkForeig");
            });

            modelBuilder.Entity<PatientDoctorReport>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("PatientDoctorReport");

                entity.Property(e => e.DateOfTreatment).HasColumnType("date");

                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.DoctorName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<PatientReport>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("PatientReport");

                entity.Property(e => e.DateOfTreatment).HasColumnType("date");

                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.DoctorName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.DrugName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Parts)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<SummaryReport>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("SummaryReport");

                entity.Property(e => e.DateOfTreatment).HasColumnType("date");

                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.DoctorName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.DrugName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Parts)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TreatMent>(entity =>
            {
                entity.ToTable("TreatMent");

                entity.Property(e => e.DateOfTreatment).HasColumnType("date");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.TreatMents)
                    .HasForeignKey(d => d.DoctorId)
                    .HasConstraintName("DoctorId_fkForeig");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.TreatMents)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("TreatMent_fkForeig");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
