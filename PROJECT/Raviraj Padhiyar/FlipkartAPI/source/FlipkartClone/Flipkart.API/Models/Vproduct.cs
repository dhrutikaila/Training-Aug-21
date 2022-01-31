using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Vproduct
    {
        public int ProductId { get; set; }
        public string ProductTitle { get; set; }
        public string ProductDescription { get; set; }
        public string BrandTitle { get; set; }
        public string CategoryTitle { get; set; }
        public string SubCategoryTitle { get; set; }
        public decimal Mrp { get; set; }
        public decimal Price { get; set; }
        public int DiscountPercentage { get; set; }
        public bool IsActive { get; set; }
    }
}
