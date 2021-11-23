﻿// <auto-generated />
using System;
using Hospital_Mange.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Hospital_Mange.Migrations
{
    [DbContext(typeof(HOSPITALContext))]
    [Migration("20211115071358_CreatehospitalDB")]
    partial class CreatehospitalDB
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseIdentityColumns()
                .HasAnnotation("Relational:Collation", "Latin1_General_CI_AS")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.1");

            modelBuilder.Entity("Hospital_Mange.Models.Assistance", b =>
                {
                    b.Property<int>("AssistanceId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("Assistance_Id")
                        .UseIdentityColumn();

                    b.Property<string>("AssistanceName")
                        .IsRequired()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("Assistance_Name");

                    b.Property<int?>("DepartmentId")
                        .HasColumnType("int")
                        .HasColumnName("Department_Id");

                    b.HasKey("AssistanceId");

                    b.HasIndex("DepartmentId");

                    b.ToTable("Assistance");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Department", b =>
                {
                    b.Property<int>("DepartmentId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("Department_Id")
                        .UseIdentityColumn();

                    b.Property<string>("DepartmentName")
                        .IsRequired()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("Department_Name");

                    b.HasKey("DepartmentId");

                    b.ToTable("Department");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Doctor", b =>
                {
                    b.Property<int>("DoctorId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("Doctor_Id")
                        .UseIdentityColumn();

                    b.Property<int?>("DepartmentId")
                        .HasColumnType("int")
                        .HasColumnName("Department_Id");

                    b.Property<string>("DoctorName")
                        .IsRequired()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("Doctor_Name");

                    b.HasKey("DoctorId");

                    b.HasIndex("DepartmentId");

                    b.ToTable("Doctor");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Drug", b =>
                {
                    b.Property<int>("DrugId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("Drug_Id")
                        .UseIdentityColumn();

                    b.Property<string>("DrugName")
                        .IsRequired()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("Drug_Name");

                    b.HasKey("DrugId");

                    b.ToTable("Drugs");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Patient", b =>
                {
                    b.Property<int>("PatientId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("Patient_Id")
                        .UseIdentityColumn();

                    b.Property<int?>("AssistanceId")
                        .HasColumnType("int")
                        .HasColumnName("Assistance_Id");

                    b.Property<int?>("DepartmentId")
                        .HasColumnType("int")
                        .HasColumnName("Department_Id");

                    b.Property<string>("PatientName")
                        .IsRequired()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("Patient_Name");

                    b.HasKey("PatientId");

                    b.HasIndex("AssistanceId");

                    b.HasIndex("DepartmentId");

                    b.ToTable("Patient");
                });

            modelBuilder.Entity("Hospital_Mange.Models.TreatMent", b =>
                {
                    b.Property<int?>("DoctorId")
                        .HasColumnType("int")
                        .HasColumnName("Doctor_Id");

                    b.Property<int?>("PatientId")
                        .HasColumnType("int")
                        .HasColumnName("Patient_Id");

                    b.HasIndex("DoctorId");

                    b.HasIndex("PatientId");

                    b.ToTable("TreatMent");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Assistance", b =>
                {
                    b.HasOne("Hospital_Mange.Models.Department", "Department")
                        .WithMany("Assistances")
                        .HasForeignKey("DepartmentId")
                        .HasConstraintName("Department_fkForeig");

                    b.Navigation("Department");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Doctor", b =>
                {
                    b.HasOne("Hospital_Mange.Models.Department", "Department")
                        .WithMany("Doctors")
                        .HasForeignKey("DepartmentId")
                        .HasConstraintName("Doctor_fkForeig");

                    b.Navigation("Department");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Patient", b =>
                {
                    b.HasOne("Hospital_Mange.Models.Assistance", "Assistance")
                        .WithMany("Patients")
                        .HasForeignKey("AssistanceId")
                        .HasConstraintName("Assistance_fkForeig");

                    b.HasOne("Hospital_Mange.Models.Department", "Department")
                        .WithMany("Patients")
                        .HasForeignKey("DepartmentId")
                        .HasConstraintName("Patient_fkForeig");

                    b.Navigation("Assistance");

                    b.Navigation("Department");
                });

            modelBuilder.Entity("Hospital_Mange.Models.TreatMent", b =>
                {
                    b.HasOne("Hospital_Mange.Models.Doctor", "Doctor")
                        .WithMany()
                        .HasForeignKey("DoctorId")
                        .HasConstraintName("DoctorId_fkForeig");

                    b.HasOne("Hospital_Mange.Models.Patient", "Patient")
                        .WithMany()
                        .HasForeignKey("PatientId")
                        .HasConstraintName("TreatMent_fkForeig");

                    b.Navigation("Doctor");

                    b.Navigation("Patient");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Assistance", b =>
                {
                    b.Navigation("Patients");
                });

            modelBuilder.Entity("Hospital_Mange.Models.Department", b =>
                {
                    b.Navigation("Assistances");

                    b.Navigation("Doctors");

                    b.Navigation("Patients");
                });
#pragma warning restore 612, 618
        }
    }
}