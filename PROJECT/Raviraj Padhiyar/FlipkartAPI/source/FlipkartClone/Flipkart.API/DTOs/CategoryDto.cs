using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class CategoryDto
    {
        public int CategoryId { get; set; }
        public string CategoryTitle { get; set; }
        public string CategoryMetaTitle { get; set; }
        public string CategoryDescription { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }
    }
}
