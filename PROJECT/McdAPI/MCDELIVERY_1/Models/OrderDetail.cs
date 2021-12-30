using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class OrderDetail
    {
        public int OrderDetailsId { get; set; }
        public int? OrderId { get; set; }
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }

        public virtual Order Order { get; set; }
        public virtual ProductTable Product { get; set; }
    }
}
