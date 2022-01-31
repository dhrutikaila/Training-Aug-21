using System;
using Day_17_Assignment.Authentication;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day_17_Assignment.Models
{
    public partial class HospitalContext : IdentityDbContext<ApplicationUser>
    {
        public HospitalContext()
        {
        }

        public HospitalContext(DbContextOptions<HospitalContext> options)
            : base(options)
        {
        }

        public virtual DbSet<DayParts> DayParts { get; set; }
        public virtual DbSet<Departments> Departments { get; set; }
        public virtual DbSet<Doctors> Doctors { get; set; }
        public virtual DbSet<Drugs> Drugs { get; set; }
        public virtual DbSet<HealthcareAssistances> HealthcareAssistances { get; set; }
        public virtual DbSet<MedicalPrescription> MedicalPrescription { get; set; }
        public virtual DbSet<Patients> Patients { get; set; }
        public virtual DbSet<Treatment> Treatment { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=Assignment_Day17_C#;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<DayParts>(entity =>
            {
                entity.HasKey(e => e.DayPartId)
                    .HasName("PK__DayParts__224674618B2B9587");

                entity.Property(e => e.DayPartName)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Departments>(entity =>
            {
                entity.HasKey(e => e.DeptId)
                    .HasName("PK__Departme__014881AEC9211E1B");

                entity.Property(e => e.DeptName)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Doctors>(entity =>
            {
                entity.HasKey(e => e.DrId)
                    .HasName("PK__Doctors__0150EEFB7D9BB80A");

                entity.Property(e => e.DrGender)
                    .HasMaxLength(6)
                    .IsUnicode(false);

                entity.Property(e => e.DrName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Drugs>(entity =>
            {
                entity.HasKey(e => e.DrugId)
                    .HasName("PK__Drugs__908D6616ED835083");

                entity.Property(e => e.DrugDisease)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.DrugName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<HealthcareAssistances>(entity =>
            {
                entity.HasKey(e => e.AsstId)
                    .HasName("PK__Healthca__AEFC9443EEADC512");

                entity.ToTable("Healthcare_Assistances");

                entity.Property(e => e.AsstGender)
                    .HasMaxLength(6)
                    .IsUnicode(false);

                entity.Property(e => e.AsstName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MedicalPrescription>(entity =>
            {
                entity.HasKey(e => e.PresId)
                    .HasName("PK__MedicalP__1401ACF389336AE4");

                entity.HasOne(d => d.DayPart)
                    .WithMany(p => p.MedicalPrescription)
                    .HasForeignKey(d => d.DayPartId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("DayPartId_Pres_FK");

                entity.HasOne(d => d.Dr)
                    .WithMany(p => p.MedicalPrescription)
                    .HasForeignKey(d => d.DrId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("DrId_Pres_FK");

                entity.HasOne(d => d.Drug)
                    .WithMany(p => p.MedicalPrescription)
                    .HasForeignKey(d => d.DrugId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("DrugId_Pres_FK");

                entity.HasOne(d => d.Pt)
                    .WithMany(p => p.MedicalPrescription)
                    .HasForeignKey(d => d.PtId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("PtId_Pres_FK");
            });

            modelBuilder.Entity<Patients>(entity =>
            {
                entity.HasKey(e => e.PtId)
                    .HasName("PK__Patients__A582753DA984B268");

                entity.Property(e => e.PtDisease)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PtGender)
                    .IsRequired()
                    .HasMaxLength(6)
                    .IsUnicode(false);

                entity.Property(e => e.PtName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Treatment>(entity =>
            {
                entity.HasKey(e => e.TrtId)
                    .HasName("PK__Treatmen__B8F3CCB1C8FF553F");

                entity.HasOne(d => d.Asst)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.AsstId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("AsstId_FK");

                entity.HasOne(d => d.Dept)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.DeptId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("DeptId_Trt_FK");

                entity.HasOne(d => d.Dr)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.DrId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("DrId_FK");

                entity.HasOne(d => d.Pt)
                    .WithMany(p => p.Treatment)
                    .HasForeignKey(d => d.PtId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("PtId_FK");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
