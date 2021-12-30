using System;
using HospitalAuthenticationTask.Authentication;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace HospitalAuthenticationTask.Models
{
    public partial class HospitalTaskDBContext : IdentityDbContext<ApplicationUser>
    {
        public HospitalTaskDBContext()
        {
        }

        public HospitalTaskDBContext(DbContextOptions<HospitalTaskDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Assistants> Assistants { get; set; }
        public virtual DbSet<DayParts> DayParts { get; set; }
        public virtual DbSet<Departments> Departments { get; set; }
        public virtual DbSet<Doctors> Doctors { get; set; }
        public virtual DbSet<Drugs> Drugs { get; set; }
        public virtual DbSet<Medications> Medications { get; set; }
        public virtual DbSet<Patients> Patients { get; set; }
        public virtual DbSet<Prescribes> Prescribes { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Assistants>(entity =>
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

            modelBuilder.Entity<DayParts>(entity =>
            {
                entity.Property(e => e.PartName)
                    .HasMaxLength(16)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Departments>(entity =>
            {
                entity.HasKey(e => e.DepartmentId)
                    .HasName("PK__Departme__B2079BEDF9BED83D");

                entity.Property(e => e.DepartmentName)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Doctors>(entity =>
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

            modelBuilder.Entity<Drugs>(entity =>
            {
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Medications>(entity =>
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

            modelBuilder.Entity<Patients>(entity =>
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

            modelBuilder.Entity<Prescribes>(entity =>
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

            base.OnModelCreating(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
