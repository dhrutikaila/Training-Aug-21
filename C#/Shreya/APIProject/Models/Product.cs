using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class Product
    {
      
        [Key]
        public int ProductId { get; set; }
        public int SubCategoryid { get; set; }
        public SubCategory subCategory { get; set; }
        public int DiscountId { get; set; }
        public Discount discount { get; set; }
        [Required(ErrorMessage ="Productname is required")]
        [MaxLength(50)]
        public string ProductName { get; set; }
        [MaxLength(100)]
        public string Description { get; set; }
        [Required(ErrorMessage ="Product price is required")]
        public decimal ProductPrice { get; set; }
        public decimal UpdatedPrice { get; set; }
        public string Image { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public DateTime DeletedAt { get; set; }
        public bool Status { get; set; }
        public ICollection<CartItem> cartItems { get; set; }
        public ICollection<Discount> discounts { get; set; }

    }
}
    