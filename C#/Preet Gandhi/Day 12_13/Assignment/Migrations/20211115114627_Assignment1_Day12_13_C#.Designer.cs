﻿// <auto-generated />
using Day_12;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Day_12.Migrations
{
    [DbContext(typeof(ToyCompany))]
    [Migration("20211115114627_Assignment1_Day12_13_C#")]
    partial class Assignment1_Day12_13_C
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.21")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Day_12.Customer", b =>
                {
                    b.Property<int>("CustomerId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("CustomerAge")
                        .HasColumnType("int");

                    b.Property<string>("CustomerName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("CustomerId");

                    b.ToTable("Customer");
                });

            modelBuilder.Entity("Day_12.CustomerAddress", b =>
                {
                    b.Property<int>("CustomerAddressId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("City")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Country")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("CustomerId")
                        .HasColumnType("int");

                    b.Property<string>("State")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("CustomerAddressId");

                    b.HasIndex("CustomerId");

                    b.ToTable("CustomerAddress");
                });

            modelBuilder.Entity("Day_12.Order", b =>
                {
                    b.Property<int>("OrderId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("CustomerAddressId")
                        .HasColumnType("int");

                    b.Property<int>("DiscountAmount")
                        .HasColumnType("int");

                    b.Property<int>("NetAmount")
                        .HasColumnType("int");

                    b.Property<int>("TotalAmount")
                        .HasColumnType("int");

                    b.HasKey("OrderId");

                    b.HasIndex("CustomerAddressId")
                        .IsUnique();

                    b.ToTable("Order");
                });

            modelBuilder.Entity("Day_12.Plant", b =>
                {
                    b.Property<int>("PlantId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("PlantAddress")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("PlantPincode")
                        .HasColumnType("int");

                    b.HasKey("PlantId");

                    b.ToTable("Plant");
                });

            modelBuilder.Entity("Day_12.PurchasedToy", b =>
                {
                    b.Property<int>("PurchasedToyId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("OrderId")
                        .HasColumnType("int");

                    b.Property<int>("ToyId")
                        .HasColumnType("int");

                    b.Property<int>("ToyQuantity")
                        .HasColumnType("int");

                    b.HasKey("PurchasedToyId");

                    b.HasIndex("OrderId");

                    b.HasIndex("ToyId");

                    b.ToTable("PurchasedToy");
                });

            modelBuilder.Entity("Day_12.Toy", b =>
                {
                    b.Property<int>("ToyId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("PlantId")
                        .HasColumnType("int");

                    b.Property<string>("ToyName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ToyPrice")
                        .HasColumnType("int");

                    b.HasKey("ToyId");

                    b.HasIndex("PlantId");

                    b.ToTable("Toy");
                });

            modelBuilder.Entity("Day_12.CustomerAddress", b =>
                {
                    b.HasOne("Day_12.Customer", "Customer")
                        .WithMany("CustomerAddress")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Day_12.Order", b =>
                {
                    b.HasOne("Day_12.CustomerAddress", "CustomerAddress")
                        .WithOne("Order")
                        .HasForeignKey("Day_12.Order", "CustomerAddressId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Day_12.PurchasedToy", b =>
                {
                    b.HasOne("Day_12.Order", "Order")
                        .WithMany("PurchasedToys")
                        .HasForeignKey("OrderId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Day_12.Toy", "Toy")
                        .WithMany("PurchasedToys")
                        .HasForeignKey("ToyId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Day_12.Toy", b =>
                {
                    b.HasOne("Day_12.Plant", "Plant")
                        .WithMany("Toy")
                        .HasForeignKey("PlantId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
