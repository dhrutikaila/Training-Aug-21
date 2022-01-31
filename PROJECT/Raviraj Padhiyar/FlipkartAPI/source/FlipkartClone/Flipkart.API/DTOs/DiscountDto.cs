using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class DiscountDto
    {
        public int DiscountId { get; set; }
        public string DiscountTitle { get; set; }
        public string DiscountDescription { get; set; }
        public int DiscountPercentage { get; set; }
        public DateTime DiscountStartDate { get; set; }
        public DateTime DiscountEndDate { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }
    }
}
