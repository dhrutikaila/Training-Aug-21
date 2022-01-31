using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class ProductImageDto
    {
        public int ProductImageId { get; set; }
        public int? ProductId { get; set; }
        public string ProductImageUrl { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }
    }
}
