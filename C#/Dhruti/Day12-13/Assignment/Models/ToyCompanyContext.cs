using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ToyShop.Models
{
    class ToyCompanyContext : DbContext
    {
        public DbSet<ToyType> ToyTypes { get; set; }
        public DbSet<ToyPlant> ToyPlants { get; set; }
        public DbSet<Toy> Toys { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<CustomerAddress> Addresses { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Item> Items { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"server=.\Sqlexpress;database=ToyCompanyDb;trusted_connection=true;");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ToyPlant>().HasKey(k => k.plantId);
            modelBuilder.Entity<ToyType>().HasKey(k => k.typeId);
            modelBuilder.Entity<CustomerAddress>().HasKey(k => k.addressId);
            modelBuilder.Entity<Order>()
                .HasOne<CustomerAddress>(s => s.CustomerAddressNavigation)
                .WithMany(s => s.OrderNavigation)
                .HasForeignKey(f => f.addressId);
            modelBuilder.Entity<Customer>().Property(p => p.isActive).HasDefaultValue(true);
            modelBuilder.Entity<CustomerAddress>().Property(p => p.isActive).HasDefaultValue(true);
            modelBuilder.Entity<Order>().Property(p => p.isActive).HasDefaultValue(true);
            modelBuilder.Entity<Item>().Property(p => p.isActive).HasDefaultValue(true);
            modelBuilder.Entity<Toy>().Property(p => p.isActive).HasDefaultValue(true);
            modelBuilder.Entity<ToyPlant>().Property(p => p.isActive).HasDefaultValue(true);
            modelBuilder.Entity<ToyType>().Property(p => p.isActive).HasDefaultValue(true);
        }
    }
}