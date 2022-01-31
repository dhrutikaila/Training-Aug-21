using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace HospitalTask.Models
{
    public partial class HospitalTaskDBContext : DbContext
    {
        public HospitalTaskDBContext()
        {
        }

        public HospitalTaskDBContext(DbContextOptions<HospitalTaskDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Assistant> Assistants { get; set; }
        public virtual DbSet<DayPart> DayParts { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<Drug> Drugs { get; set; }
        public virtual DbSet<Medication> Medications { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<Prescribe> Prescribes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=DESKTOP-3LNGVVH\\SQLEXPRESS;Database=HospitalTaskDB;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Assistant>(entity =>
            {
                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(16)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(16)
                    .IsUnicode(false);

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Assistants)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("FK_Assistant_DepartmentID");
            });

            modelBuilder.Entity<DayPart>(entity =>
            {
                entity.Property(e => e.PartName)
                    .HasMaxLength(16)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Doctor>(entity =>
            {
                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(16)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(16)
                    .IsUnicode(false);

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Doctors)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("FK_Dcotor_DepartmentID");
            });

            modelBuilder.Entity<Drug>(entity =>
            {
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Medication>(entity =>
            {
                entity.Property(e => e.DayPartId).HasColumnName("dayPartId");

                entity.Property(e => e.DrugId).HasColumnName("DrugID");

                entity.Property(e => e.PrescribeId).HasColumnName("PrescribeID");

                entity.HasOne(d => d.DayPart)
                    .WithMany(p => p.Medications)
                    .HasForeignKey(d => d.DayPartId)
                    .HasConstraintName("FK_Medication_dayPartId");

                entity.HasOne(d => d.Drug)
                    .WithMany(p => p.Medications)
                    .HasForeignKey(d => d.DrugId)
                    .HasConstraintName("FK_Medication_Drug_ID");

                entity.HasOne(d => d.Prescribe)
                    .WithMany(p => p.Medications)
                    .HasForeignKey(d => d.PrescribeId)
                    .HasConstraintName("FK_Meidation_Prescribe_Id");
            });

            modelBuilder.Entity<Patient>(entity =>
            {
                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(16)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(16)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Prescribe>(entity =>
            {
                entity.Property(e => e.Date).HasColumnType("date");

                entity.HasOne(d => d.Assistant)
                    .WithMany(p => p.Prescribes)
                    .HasForeignKey(d => d.AssistantId)
                    .HasConstraintName("FK_Prescribe_AssistantId");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.Prescribes)
                    .HasForeignKey(d => d.DoctorId)
                    .HasConstraintName("FK_Prescribe_DoctorId");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Prescribes)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_Prescribe_PatientId");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
