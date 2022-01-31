using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class ToyCompanyContext : DbContext
    {
        public ToyCompanyContext(DbContextOptions<ToyCompanyContext> options) : base(options)
        {

        }
        public DbSet<Customer> Customer { get; set; }
        public DbSet<Toy> Toy { get; set; }
        public DbSet<Toytype> ToyType { get; set; }
        public DbSet<CustomerAddress> CustomerAddresse { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<Plant> Plant { get; set; }
        public DbSet<PurchaseDetail> PurchaseDetail { get; set; }

    }
}
