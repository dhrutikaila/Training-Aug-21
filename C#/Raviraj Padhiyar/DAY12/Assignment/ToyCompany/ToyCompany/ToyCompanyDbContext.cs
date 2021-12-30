using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ToyCompany.Models;

namespace ToyCompany
{
    class ToyCompanyDbContext : DbContext
    {
        //Dbset Declaration

        public DbSet<Toy> Toys { get; set; }
        public DbSet<ToyType> ToyTypes { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<ManufacturingPlant> ManufacturingPlants { get; set; }
        public DbSet<ToyProduction> ToyProductions { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<OrderHeader> OrderHeaders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<ShippingAddress> ShippingAddresses { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-3LNGVVH\SQLEXPRESS;Initial Catalog=ToyCompanyDb;Integrated Security=True;");
        }

        

    }
}
