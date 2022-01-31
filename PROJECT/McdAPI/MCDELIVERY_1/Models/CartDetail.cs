using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class CartDetail
    {
        public int CartDetailId { get; set; }
        public int? CartId { get; set; }
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }

        public virtual Cart Cart { get; set; }
        public virtual ProductTable Product { get; set; }
    }
}
