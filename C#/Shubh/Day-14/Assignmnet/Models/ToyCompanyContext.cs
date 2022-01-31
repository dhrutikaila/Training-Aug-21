using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Day_14_Assignment.Models
{
    public class ToyCompanyContext : DbContext
    {
        public ToyCompanyContext(DbContextOptions<ToyCompanyContext> options) : base(options)
        {

        }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<CustomerAddress> CustomerAddresses { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Plant> Plants { get; set; }
        public DbSet<PurchasedToy> PurchasedToys { get; set; }
        public DbSet<Toy> Toys { get; set; }

    }
}