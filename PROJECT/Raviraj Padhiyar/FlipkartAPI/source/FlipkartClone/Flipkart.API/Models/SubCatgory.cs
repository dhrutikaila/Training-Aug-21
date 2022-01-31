using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class SubCatgory
    {
        public SubCatgory()
        {
            Products = new HashSet<Product>();
        }

        public int SubCategoryId { get; set; }
        public int? CategoryId { get; set; }
        public string SubCategoryTitle { get; set; }
        public string SubCategoryMetaTitle { get; set; }
        public string SubCategoryDescription { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual Category Category { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
