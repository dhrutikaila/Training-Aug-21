using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        [Required(ErrorMessage ="Category name is required")]
        [MaxLength(50)]
        public string CategoryName { get; set; }
        [MaxLength(100)]
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public DateTime DeletedAt { get; set; }
        public bool Status { get; set; }
        public ICollection<SubCategory> subCategories { get; set; }
        public ICollection<Product> products { get; set; }
        public ICollection<Discount> discounts { get; set; }
    }
}
