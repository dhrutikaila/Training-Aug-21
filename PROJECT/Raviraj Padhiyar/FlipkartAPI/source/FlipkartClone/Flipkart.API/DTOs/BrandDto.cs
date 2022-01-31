using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class BrandDto
    {
        public int BrandId { get; set; }
        public string BrandTitle { get; set; }
        public string Description { get; set; }
        //public DateTime ModifiedAt { get; set; }
        //public bool? IsActive { get; set; }
    }
}
