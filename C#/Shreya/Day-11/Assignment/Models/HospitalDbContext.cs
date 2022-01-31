using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
#nullable disable
namespace Day_10.Models
{
    public partial class HospitalDbContext : DbContext
    {
        public HospitalDbContext()
        {
        }
        public HospitalDbContext(DbContextOptions<HospitalDbContext> options)
            : base(options)
        {
        }
        public virtual DbSet<Assistance> Assistances { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<Drug> Drugs { get; set; }
        public virtual DbSet<DrugsSchedule> DrugsSchedules { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<TreatMent> TreatMents { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=LAPTOP-TVU52H4T;Database=HospitalDb;Trusted_Connection=True;");
            }
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");
            modelBuilder.Entity<Assistance>(entity =>
            {
                entity.ToTable("Assistance");
                entity.Property(e => e.AssistanceId).HasColumnName("Assistance_Id");
                entity.Property(e => e.AssistanceName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Assistance_Name");
                entity.Property(e => e.DepartmentId).HasColumnName("Department_Id");
                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Assistances)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("Department_fkForeig");
            });
            modelBuilder.Entity<Department>(entity =>
            {
                entity.ToTable("Department");
                entity.Property(e => e.DepartmentId).HasColumnName("Department_Id");
                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Department_Name");
            });
            modelBuilder.Entity<Doctor>(entity =>
            {
                entity.ToTable("Doctor");
                entity.Property(e => e.DoctorId).HasColumnName("Doctor_Id");
                entity.Property(e => e.DepartmentId).HasColumnName("Department_Id");
                entity.Property(e => e.DoctorName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Doctor_Name");
                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Doctors)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("Doctor_fkForeig");
            });
            modelBuilder.Entity<Drug>(entity =>
            {
                entity.Property(e => e.DrugId).HasColumnName("Drug_Id");
                entity.Property(e => e.DrugName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Drug_Name");
            });
            modelBuilder.Entity<DrugsSchedule>(entity =>
            {
                entity.HasNoKey();
                entity.ToTable("Drugs_Schedule");
                entity.Property(e => e.DrugId).HasColumnName("Drug_Id");
                entity.Property(e => e.Parts)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
                entity.Property(e => e.PatientId).HasColumnName("Patient_Id");
                entity.HasOne(d => d.Drug)
                    .WithMany()
                    .HasForeignKey(d => d.DrugId)
                    .HasConstraintName("drug_fkForeig");
                entity.HasOne(d => d.Patient)
                    .WithMany()
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("PatientId_fkForeig");
            });
            modelBuilder.Entity<Patient>(entity =>
            {
                entity.ToTable("Patient");
                entity.Property(e => e.PatientId).HasColumnName("Patient_Id");
                entity.Property(e => e.AssistanceId).HasColumnName("Assistance_Id");
                entity.Property(e => e.DepartmentId).HasColumnName("Department_Id");
                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Patient_Name");
                entity.HasOne(d => d.Assistance)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.AssistanceId)
                    .HasConstraintName("Assistance_fkForeig");
                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("Patient_fkForeig");
            });

            modelBuilder.Entity<TreatMent>(entity =>
            {
                entity.HasNoKey();
                entity.ToTable("TreatMent");
                entity.Property(e => e.DoctorId).HasColumnName("Doctor_Id");
                entity.Property(e => e.PatientId).HasColumnName("Patient_Id");
                entity.HasOne(d => d.Doctor)
                    .WithMany()
                    .HasForeignKey(d => d.DoctorId)
                    .HasConstraintName("DoctorId_fkForeig");
                entity.HasOne(d => d.Patient)
                    .WithMany()
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("TreatMent_fkForeig");
            });
            OnModelCreatingPartial(modelBuilder);
        }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
