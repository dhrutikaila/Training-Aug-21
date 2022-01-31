using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class SubCatgoryDto
    {
        public int SubCategoryId { get; set; }
        public int? CategoryId { get; set; }
        public string SubCategoryTitle { get; set; }
        public string SubCategoryMetaTitle { get; set; }
        public string SubCategoryDescription { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }
    }
}
