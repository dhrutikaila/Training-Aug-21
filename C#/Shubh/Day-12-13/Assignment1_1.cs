using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Day_12
{

    public class Plant
    {
        [Key]
        public int PlantId { get; set; }
        [Required]
        public string PlantAddress { get; set; }
        [Required]
        public int PlantPincode { get; set; }

        public ICollection<Toy> Toy { get; set; }
    }
    public class Customer
    {
        [Key]
        public int CustomerId { get; set; }
        [Required]
        public string CustomerName { get; set; }
        public int CustomerAge { get; set; }

        public ICollection<CustomerAddress> CustomerAddress { get; set; }
    }
    public class CustomerAddress
    {
        [Key]
        public int CustomerAddressId { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }

        public int CustomerId { get; set; }
        public Customer Customer { get; set; }

        public Order Order { get; set; }
    }
    public class Toy
    {
        [Key]
        public int ToyId { get; set; }
        [Required]
        public string ToyName { get; set; }
        [Required]
        public int ToyPrice { get; set; }

        public int PlantId { get; set; }
        public Plant Plant { get; set; }

        public ICollection<PurchasedToy> PurchasedToys { get; set; }
    }

    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        public int TotalAmount { get; set; }
        public int DiscountAmount { get; set; }
        public int NetAmount { get; set; }

        public int CustomerAddressId { get; set; }
        public CustomerAddress CustomerAddress { get; set; }

        public ICollection<PurchasedToy> PurchasedToys { get; set; }
    }

    public class PurchasedToy
    {
        [Key]
        public int PurchasedToyId { get; set; }
        public int OrderId { get; set; }
        public Order Order { get; set; }

        public int ToyId { get; set; }
        public Toy Toy { get; set; }
        [Required]
        public int ToyQuantity { get; set; }
    }


    public class ToyCompany : DbContext
    {
        public DbSet<Plant> Plant { get; set; }
        public DbSet<Customer> Customer { get; set; }
        public DbSet<CustomerAddress> CustomerAddress { get; set; }
        public DbSet<Toy> Toy { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<PurchasedToy> PurchasedToy { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CustomerAddress>()
                .HasOne<Order>(o => o.Order)
                .WithOne(ca => ca.CustomerAddress)
                .HasForeignKey<Order>(ad => ad.CustomerAddressId);


        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS;Database=Assignment1_Day12_13_C#;Trusted_Connection=True;");
        }
    }


    class Assignment1_Day12_13
    {
        static void Main(string[] args)
        {
            using (var context = new ToyCompany())
            {
                //CRUD
                var plants = new Plant()
                {
                    PlantAddress = "Ahmedabad",
                    PlantPincode = 134657
                };
                context.Plant.Add(plants);
                var plants2 = new Plant()
                {
                    PlantAddress = "Vadodara",
                    PlantPincode = 753454
                };
                context.Plant.Add(plants2);

                var customer = new Customer()
                {
                    CustomerName = "Hiren Panchal",
                    CustomerAge = 35
                };
                context.Customer.Add(customer);
                var customer2 = new Customer()
                {
                    CustomerName = "Jai Shah",
                    CustomerAge = 50
                };
                context.Customer.Add(customer2);
                context.SaveChanges();


                //StoreProcedure
                var toy = context.Toy.FromSqlRaw("GetToy 'Car'").ToList();
                foreach(var res in toy)
                {
                    Console.WriteLine($"ToyId: {res.ToyId} \nToyName: {res.ToyName} \nToyPrice: {res.ToyPrice}");
                }
                
            }
        }
    }
}