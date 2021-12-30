using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ToyCompany.API.Models
{
    public partial class ToyCompanyDbContext : DbContext
    {
        public ToyCompanyDbContext()
        {
        }

        public ToyCompanyDbContext(DbContextOptions<ToyCompanyDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Addresses> Addresses { get; set; }
        public virtual DbSet<Customers> Customers { get; set; }
        public virtual DbSet<ManufacturingPlants> ManufacturingPlants { get; set; }
        public virtual DbSet<OrderDetails> OrderDetails { get; set; }
        public virtual DbSet<OrderHeaders> OrderHeaders { get; set; }
        public virtual DbSet<ShippingAddresses> ShippingAddresses { get; set; }
        public virtual DbSet<ToyProductions> ToyProductions { get; set; }
        public virtual DbSet<ToyTypes> ToyTypes { get; set; }
        public virtual DbSet<Toys> Toys { get; set; }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    if (!optionsBuilder.IsConfigured)
        //    {
        //        optionsBuilder.UseSqlServer("Data Source=DESKTOP-3LNGVVH\\SQLEXPRESS;Initial Catalog=ToyCompanyDb;Integrated Security=True;");
        //    }
        //}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Addresses>(entity =>
            {
                entity.Property(e => e.City)
                    .IsRequired()
                    .HasMaxLength(32)
                    .HasDefaultValueSql("(N'')");

                entity.Property(e => e.State)
                    .IsRequired()
                    .HasMaxLength(32)
                    .HasDefaultValueSql("(N'')");
            });

            modelBuilder.Entity<Customers>(entity =>
            {
                entity.Property(e => e.ContactNumber)
                    .IsRequired()
                    .HasMaxLength(10)
                    .HasDefaultValueSql("(N'')");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("(CONVERT([bit],(0)))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(32)
                    .HasDefaultValueSql("(N'')");
            });

            modelBuilder.Entity<ManufacturingPlants>(entity =>
            {
                entity.HasIndex(e => e.AddressId);

                entity.HasOne(d => d.Address)
                    .WithMany(p => p.ManufacturingPlants)
                    .HasForeignKey(d => d.AddressId);
            });

            modelBuilder.Entity<OrderDetails>(entity =>
            {
                entity.HasIndex(e => e.OrderId);

                entity.HasIndex(e => e.ToyId);

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId);

                entity.HasOne(d => d.Toy)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ToyId);
            });

            modelBuilder.Entity<OrderHeaders>(entity =>
            {
                entity.HasIndex(e => e.CustomerId);

                entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.OrderHeaders)
                    .HasForeignKey(d => d.CustomerId);
            });

            modelBuilder.Entity<ShippingAddresses>(entity =>
            {
                entity.HasIndex(e => e.AddressId);

                entity.HasIndex(e => e.OrderHeaderId);

                entity.HasOne(d => d.Address)
                    .WithMany(p => p.ShippingAddresses)
                    .HasForeignKey(d => d.AddressId);

                entity.HasOne(d => d.OrderHeader)
                    .WithMany(p => p.ShippingAddresses)
                    .HasForeignKey(d => d.OrderHeaderId);
            });

            modelBuilder.Entity<ToyProductions>(entity =>
            {
                entity.HasIndex(e => e.ManufacturingPlantId);

                entity.HasIndex(e => e.TypeId);

                entity.HasOne(d => d.ManufacturingPlant)
                    .WithMany(p => p.ToyProductions)
                    .HasForeignKey(d => d.ManufacturingPlantId);

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.ToyProductions)
                    .HasForeignKey(d => d.TypeId);
            });

            modelBuilder.Entity<ToyTypes>(entity =>
            {
                entity.Property(e => e.TypeName)
                    .IsRequired()
                    .HasMaxLength(32)
                    .HasDefaultValueSql("(N'')");
            });

            modelBuilder.Entity<Toys>(entity =>
            {
                entity.HasIndex(e => e.TypeId);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ToyName)
                    .IsRequired()
                    .HasMaxLength(32)
                    .HasDefaultValueSql("(N'')");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.Toys)
                    .HasForeignKey(d => d.TypeId);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
