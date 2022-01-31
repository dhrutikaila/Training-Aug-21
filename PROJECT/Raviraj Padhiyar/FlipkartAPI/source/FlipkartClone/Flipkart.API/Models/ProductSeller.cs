using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class ProductSeller
    {
        public int? ProductId { get; set; }
        public int? SellerId { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }
        public int ProductSellerId { get; set; }

        public virtual Product Product { get; set; }
        public virtual Seller Seller { get; set; }
    }
}
