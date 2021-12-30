using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ToyProject1.Models
{
    class ToysDbContext: DbContext
    {
        public DbSet<Address> Addresses{ get; set; }
        public DbSet<Customer> Customers{ get; set; }
        public DbSet<Order> Orders{ get; set; }
        public DbSet<Plant> Plants{ get; set; }
        public DbSet<Purchase> Purchases{ get; set; }
        public DbSet<Toy> Toys{ get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-R8JIN40;Initial Catalog=ToysOne;Integrated Security=True");
     
        
            
        }

    }
}
