using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day12.ToyModels
{
    public class ToysContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;database=Toys;User ID=dd;Password=12345; persist security info=True;");

        }
        public DbSet<Toy> Toys { get; set; }
        public DbSet<ToyType> ToyType { get; set; }
        public DbSet<ManuPlant> Plants { get; set; }
        public DbSet<Offers> Offer { get; set; }
        public DbSet<Customers> Customers { get; set; }
        public DbSet<Orders> Orders { get; set; }
        public DbSet<CustomerAddress> CustomerAddress { get; set; }
    }
}
