using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class SubCategory
    {
        [Key]
        public int SubCategoryId { get; set; }
        public int CategoryId { get; set; }
        public Category category { get; set; }
        
        [Required(ErrorMessage ="Subcategoryname is required")]
        [MaxLength(50)]
        public string SubCategoryName { get; set; }
        [MaxLength(100)]
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public DateTime DeletedAt { get; set; }
        public bool Status { get; set; }
        //public ICollection<Product> products { get; set; }
    }
}
