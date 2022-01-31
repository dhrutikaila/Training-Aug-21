using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Day12_13.Models
{
    class ToyCompanyContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=LAPTOP-TVU52H4T;Database=ToyCompany;Trusted_Connection=True;");
        }

        public DbSet<Plant> Plant { get; set; }
        public DbSet<ToyType> ToysType { get; set; }
        public DbSet<CustomerAddress> Addresse { get; set; }
        public DbSet<Customer> Customer { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<Toy> Toy { get; set; }
        public DbSet<PurchaseDetail> PurchaseDetail { get; set; }
    }
}
