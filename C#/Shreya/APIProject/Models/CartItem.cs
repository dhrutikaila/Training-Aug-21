using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class CartItem
    {
        [Key]
        public int CartItemId { get; set; }
        public int UserId { get; set; }
        public User user { get; set; }
        public int ProductId { get; set; }
        public  Product Product { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        //public int Discount { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public DateTime DeletedAt { get; set; }
        public bool Status { get; set; }
      // public ICollection<Product> Products { get; set; }
       public ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
