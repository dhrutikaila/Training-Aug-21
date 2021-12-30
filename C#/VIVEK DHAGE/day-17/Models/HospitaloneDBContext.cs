using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Day17_1.Models
{
    public partial class HospitaloneDBContext : DbContext
    {
        public HospitaloneDBContext()
        {
        }


        public HospitaloneDBContext(DbContextOptions<HospitaloneDBContext> options)
       : base(options)
        {
        }

        public virtual DbSet<Assistant> Assistants { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<Drug> Drugs { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<Prescribe> Prescribes { get; set; }
        public virtual DbSet<Treatment> Treatments { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//                optionsBuilder.UseSqlServer("Data Source=DESKTOP-R8JIN40;Initial Catalog=HospitaloneDB;Integrated Security=True");
//            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
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
                    .HasConstraintName("FK_Prescribe_AssitantId");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.Prescribes)
                    .HasForeignKey(d => d.DoctorId)
                    .HasConstraintName("FK_Prescribe_DoctorId");

                entity.HasOne(d => d.Drug)
                    .WithMany(p => p.Prescribes)
                    .HasForeignKey(d => d.DrugId)
                    .HasConstraintName("FK_Prescribe_DrugId");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Prescribes)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_Prescribe_PatientId");
            });

            modelBuilder.Entity<Treatment>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Treatment");

                entity.HasOne(d => d.Assistant)
                    .WithMany()
                    .HasForeignKey(d => d.AssistantId)
                    .HasConstraintName("FK_Treatment_Assitant_ID");

                entity.HasOne(d => d.Doctor)
                    .WithMany()
                    .HasForeignKey(d => d.DoctorId)
                    .HasConstraintName("FK_Treatment_Doctor_ID");

                entity.HasOne(d => d.Patient)
                    .WithMany()
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_Treatment_Patient_ID");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
