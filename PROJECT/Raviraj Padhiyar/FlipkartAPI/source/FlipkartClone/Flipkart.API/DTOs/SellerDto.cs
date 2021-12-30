using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class SellerDto
    {
        public int SellerId { get; set; }
        public string SellerName { get; set; }
        public string SellerContactNumber { get; set; }
        public string SellerEmail { get; set; }
        public int? AddressId { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
