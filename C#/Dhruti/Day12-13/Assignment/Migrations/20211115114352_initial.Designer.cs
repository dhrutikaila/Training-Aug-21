﻿using ToyShop.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Day12_13_Assignment.Migrations
{
    [DbContext(typeof(ToyCompanyContext))]
    [Migration("20211115114352_initial")]
    partial class initial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.21")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Day12_13_Assignment.Models.Customer", b =>
            {
                b.Property<int>("customerId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                b.Property<string>("firstName")
                    .HasColumnType("nvarchar(max)");

                b.Property<bool>("isActive")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("bit")
                    .HasDefaultValue(true);

                b.Property<string>("lastName")
                    .HasColumnType("nvarchar(max)");

                b.Property<int>("phoneNumber")
                    .HasColumnType("int");

                b.HasKey("customerId");

                b.ToTable("Customers");
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.CustomerAddress", b =>
            {
                b.Property<int>("addressId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                b.Property<string>("address")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("city")
                    .HasColumnType("nvarchar(max)");

                b.Property<int>("customerId")
                    .HasColumnType("int");

                b.Property<bool>("isActive")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("bit")
                    .HasDefaultValue(true);

                b.HasKey("addressId");

                b.HasIndex("customerId");

                b.ToTable("Addresses");
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.Item", b =>
            {
                b.Property<int>("itemId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                b.Property<bool>("isActive")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("bit")
                    .HasDefaultValue(true);

                b.Property<int>("orderId")
                    .HasColumnType("int");

                b.Property<int>("quantity")
                    .HasColumnType("int");

                b.Property<int>("toyId")
                    .HasColumnType("int");

                b.HasKey("itemId");

                b.HasIndex("orderId");

                b.HasIndex("toyId");

                b.ToTable("Items");
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.Order", b =>
            {
                b.Property<int>("orderId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                b.Property<int>("addressId")
                    .HasColumnType("int");

                b.Property<bool>("isActive")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("bit")
                    .HasDefaultValue(true);

                b.HasKey("orderId");

                b.HasIndex("addressId");

                b.ToTable("Orders");
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.Toy", b =>
            {
                b.Property<int>("toyId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                b.Property<bool>("isActive")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("bit")
                    .HasDefaultValue(true);

                b.Property<string>("toyName")
                    .HasColumnType("nvarchar(max)");

                b.Property<int>("toyPlantId")
                    .HasColumnType("int");

                b.Property<double>("toyPrice")
                    .HasColumnType("float");

                b.HasKey("toyId");

                b.HasIndex("toyPlantId");

                b.ToTable("Toys");
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.ToyPlant", b =>
            {
                b.Property<int>("plantId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                b.Property<bool>("isActive")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("bit")
                    .HasDefaultValue(true);

                b.Property<string>("plantCity")
                    .HasColumnType("nvarchar(max)");

                b.Property<string>("plantName")
                    .HasColumnType("nvarchar(max)");

                b.Property<int>("toyTypeId")
                    .HasColumnType("int");

                b.HasKey("plantId");

                b.HasIndex("toyTypeId")
                    .IsUnique();

                b.ToTable("ToyPlants");
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.ToyType", b =>
            {
                b.Property<int>("typeId")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("int")
                    .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                b.Property<bool>("isActive")
                    .ValueGeneratedOnAdd()
                    .HasColumnType("bit")
                    .HasDefaultValue(true);

                b.Property<string>("typeName")
                    .HasColumnType("nvarchar(max)");

                b.HasKey("typeId");

                b.ToTable("ToyTypes");
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.CustomerAddress", b =>
            {
                b.HasOne("Day12_13_Assignment.Models.Customer", "CustomerNavigation")
                    .WithMany("AddressNavigation")
                    .HasForeignKey("customerId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.Item", b =>
            {
                b.HasOne("Day12_13_Assignment.Models.Order", "OrderNavigation")
                    .WithMany("ItemNavigation")
                    .HasForeignKey("orderId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();

                b.HasOne("Day12_13_Assignment.Models.Toy", "ToyNavigation")
                    .WithMany("ItemNavigation")
                    .HasForeignKey("toyId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.Order", b =>
            {
                b.HasOne("Day12_13_Assignment.Models.CustomerAddress", "CustomerAddressNavigation")
                    .WithMany("OrderNavigation")
                    .HasForeignKey("addressId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.Toy", b =>
            {
                b.HasOne("Day12_13_Assignment.Models.ToyPlant", "ToyPlantNavigation")
                    .WithMany("ToyNavigation")
                    .HasForeignKey("toyPlantId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });

            modelBuilder.Entity("Day12_13_Assignment.Models.ToyPlant", b =>
            {
                b.HasOne("Day12_13_Assignment.Models.ToyType", "ToyTypeNavigation")
                    .WithOne("ToyPlantNavigation")
                    .HasForeignKey("Day12_13_Assignment.Models.ToyPlant", "toyTypeId")
                    .OnDelete(DeleteBehavior.Cascade)
                    .IsRequired();
            });
#pragma warning restore 612, 618
        }
    }
}