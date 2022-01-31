using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class MamaEarthDBContext : DbContext
    {
        public MamaEarthDBContext(DbContextOptions<MamaEarthDBContext> options) : base(options)
        {
        }
        public DbSet<User> User { get; set; }
        public DbSet<UserAddress> UserAddress { get; set; }
        public DbSet<Admin> Admin { get; set; }
        public DbSet<Category> Category { get; set; }
        public DbSet<SubCategory> SubCategory { get; set; }
        public DbSet<Product> Product { get; set; }
        public DbSet<Discount> Discount { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<PurchaseDetail> PurchaseDetail { get; set; }
        //public DbSet<Cart> Cart { get; set; }
        public DbSet<CartItem> CartItem { get; set; }
        public DbSet<PaymentDetail> PaymentDetail { get; set; }
        public DbSet<PaymentMethod> PaymentMethod { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<OrderDetail>()
                .HasOne(f => f.Order)
                .WithMany(f=>f.OrderDetails)
            .OnDelete(DeleteBehavior.Cascade);
            
            //modelBuilder.Entity<Product>()
            //    .HasOne(f => f.discount)    
            //    .WithMany(f => f.)  
            //.OnDelete(DeleteBehavior.NoAction);
            // modelBuilder.Entity<CartItem>().HasMany(f => f.Products).WithOne().HasForeignKey(x=>x.ProductId);

        }
    }
}
