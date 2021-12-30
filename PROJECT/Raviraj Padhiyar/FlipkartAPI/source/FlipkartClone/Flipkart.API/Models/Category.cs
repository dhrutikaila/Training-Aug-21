using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Category
    {
        public Category()
        {
            Products = new HashSet<Product>();
            SubCatgories = new HashSet<SubCatgory>();
        }

        public int CategoryId { get; set; }
        public string CategoryTitle { get; set; }
        public string CategoryMetaTitle { get; set; }
        public string CategoryDescription { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<SubCatgory> SubCatgories { get; set; }
    }
}
