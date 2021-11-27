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

      
            protected override void OnConfiguring(DbContextOptionsBuilder dbContextOptionsBuilder)
            {
                dbContextOptionsBuilder.UseSqlServer(@"Server=pc0474\mssql2017; Database=ToyCompany; Trusted_connection=true;");
            }

            protected override void OnModelCreating(ModelBuilder modelBuilder)
            {
                modelBuilder.Entity<Item>().HasKey(odr => new { odr.OrderId, odr.ToyId });

                //modelBuilder.Entity<Orders>().Property(s => s.OrderDate).HasDefaultValue(DateTime.Now);
            }


            public DbSet<Customer> Customers { get; set; }

            public DbSet<CustomerAddress> CustomerAddresses { get; set; }

            public DbSet<ToyPlant> Plants { get; set; }

            public DbSet<Toy> Toys { get; set; }

            public DbSet<Order> Orders { get; set; }

            public DbSet<Item> OrderItems { get; set; }
        }
    }