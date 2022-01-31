using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Seller
    {
        public Seller()
        {
            ProductSellers = new HashSet<ProductSeller>();
        }

        public int SellerId { get; set; }
        public string SellerName { get; set; }
        public string SellerContactNumber { get; set; }
        public string SellerEmail { get; set; }
        public int? AddressId { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual Address Address { get; set; }
        public virtual ICollection<ProductSeller> ProductSellers { get; set; }
    }
}
