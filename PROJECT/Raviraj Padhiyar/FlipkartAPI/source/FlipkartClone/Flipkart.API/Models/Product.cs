using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Product
    {
        public Product()
        {
            CartItems = new HashSet<CartItem>();
            Inventories = new HashSet<Inventory>();
            OrderDetails = new HashSet<OrderDetail>();
            ProductImages = new HashSet<ProductImage>();
            ProductSellers = new HashSet<ProductSeller>();
        }

        public int ProductId { get; set; }
        public string ProductTitle { get; set; }
        public string ProductDescription { get; set; }
        public int? BrandId { get; set; }
        public int? CategoryId { get; set; }
        public decimal Mrp { get; set; }
        public decimal Price { get; set; }
        public double UnitWeight { get; set; }
        public int? DiscountId { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }
        public int? SubCategoryId { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual Category Category { get; set; }
        public virtual Discount Discount { get; set; }
        public virtual SubCatgory SubCategory { get; set; }
        public virtual ICollection<CartItem> CartItems { get; set; }
        public virtual ICollection<Inventory> Inventories { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<ProductImage> ProductImages { get; set; }
        public virtual ICollection<ProductSeller> ProductSellers { get; set; }
    }
}
