using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Doctor_Api.Models
{
    public partial class HOSPITALContext : DbContext
    {
        public HOSPITALContext()
        {
        }

        public HOSPITALContext(DbContextOptions<HOSPITALContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<Drug> Drugs { get; set; }
        public virtual DbSet<Assistance> HealthcareAssistants { get; set; }
        public virtual DbSet<MedicineList> MedicineLists { get; set; }
        public virtual DbSet<Object> Objects { get; set; }
        public virtual DbSet<ObjectMaster> ObjectMasters { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<PatientDoctor> PatientsDoctors { get; set; }
        public virtual DbSet<Prescription> Prescriptions { get; set; }
        public virtual DbSet<Treatment> Treatments { get; set; }
        public virtual DbSet<LoginInfo> LoginInfos { get;  set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=pc0474\\mssql2017; Database=HospitalManagementSystem; Trusted_connection=true;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Latin1_General_CI_AS");

            modelBuilder.Entity<Department>(entity =>
            {
                entity.HasKey(e => e.DeptId)
                    .HasName("PK__Departme__0148818E0E67723E");

                entity.Property(e => e.DeptId).HasColumnName("DeptID");

                entity.Property(e => e.DeptName)
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Doctor>(entity =>
            {
                entity.Property(e => e.DoctorId).HasColumnName("DoctorID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.DoctorName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Drug>(entity =>
            {
                entity.HasKey(e => e.DrugsId)
                    .HasName("PK__Drugs__96604F90B8D05331");

                entity.Property(e => e.DrugsId).HasColumnName("DrugsID");

                entity.Property(e => e.DrugDescription)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.DrugName)
                    .IsRequired()
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.ExpiryDate).HasColumnType("date");

                entity.Property(e => e.Price).HasColumnType("decimal(8, 2)");
            });

            modelBuilder.Entity<Assistance>(entity =>
            {
                entity.HasKey(e => e.AssistantId)
                    .HasName("PK__Healthca__3756F7502BCFE540");

                entity.Property(e => e.AssistantId).HasColumnName("AssistantID");

                entity.Property(e => e.AssistantName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Salary).HasColumnType("decimal(8, 2)");

                entity.HasOne(d => d.DeptNoNavigation)
                    .WithMany(p => p.HealthcareAssistants)
                    .HasForeignKey(d => d.DeptNo)
                    .HasConstraintName("FK_Dept");
            });
            modelBuilder.Entity<LoginInfo>(entity =>
            {
                entity.HasKey(e => e.UserId)
                    .HasName("PK__LoginInf__1788CC4CB142430A");

                entity.ToTable("LoginInfo");

                entity.Property(e => e.EmailAddress)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.GivenName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Role)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasDefaultValueSql("('User')");

                entity.Property(e => e.Surname)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });


            modelBuilder.Entity<MedicineList>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("Medicine_list");

                entity.Property(e => e.MedicineList1)
                    .HasMaxLength(8000)
                    .IsUnicode(false)
                    .HasColumnName("Medicine_list");

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Object>(entity =>
            {
                entity.HasKey(e => e.ObjId)
                    .HasName("PK__Object__2D8B34D56A0789F6");

                entity.ToTable("Object");

                entity.Property(e => e.ObjId).HasColumnName("Obj_Id");

                entity.Property(e => e.ObjName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Obj_Name");

                entity.Property(e => e.TypeId).HasColumnName("Type_Id");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.Objects)
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Type_Id");
            });

            modelBuilder.Entity<ObjectMaster>(entity =>
            {
                entity.HasKey(e => e.TypeId)
                    .HasName("PK__ObjectMa__FE90DD9E8E225B19");

                entity.ToTable("ObjectMaster");

                entity.Property(e => e.TypeId).HasColumnName("Type_Id");

                entity.Property(e => e.TypeName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Type_Name");
            });

            modelBuilder.Entity<Patient>(entity =>
            {
                entity.Property(e => e.PatientId).HasColumnName("PatientID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.BloodGroup)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<PatientDoctor>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("Patients_Doctor");

                entity.Property(e => e.DoctorName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Doctor Name");

                entity.Property(e => e.PatientName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Patient Name");
            });

            modelBuilder.Entity<Prescription>(entity =>
            {
                entity.HasKey(e => e.PreId)
                    .HasName("PK__Prescrip__7024C129B4A9EF0A");

                entity.ToTable("Prescription");

                entity.Property(e => e.PreId).HasColumnName("PreID");

                entity.Property(e => e.DoctorId).HasColumnName("DoctorID");

                entity.Property(e => e.DrugsId).HasColumnName("DrugsID");

                entity.Property(e => e.PatientId).HasColumnName("PatientID");

                entity.Property(e => e.PreDate).HasColumnType("date");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.Prescriptions)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DrID");

                entity.HasOne(d => d.Drugs)
                    .WithMany(p => p.Prescriptions)
                    .HasForeignKey(d => d.DrugsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DrugId");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Prescriptions)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatID");
            });

            modelBuilder.Entity<Treatment>(entity =>
            {
                entity.HasKey(e => e.TrtId)
                    .HasName("PK__Treatmen__B8F3CCD1C2087D41");

                entity.ToTable("Treatment");

                entity.Property(e => e.TrtId).HasColumnName("TrtID");

                entity.Property(e => e.DeptId).HasColumnName("DeptID");

                entity.Property(e => e.DoctorId).HasColumnName("DoctorID");

                entity.Property(e => e.PatientId).HasColumnName("PatientID");

                entity.Property(e => e.TrtDate)
                    .HasColumnType("date")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Dept)
                    .WithMany(p => p.Treatments)
                    .HasForeignKey(d => d.DeptId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DeptID");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.Treatments)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorID");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Treatments)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientID");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}