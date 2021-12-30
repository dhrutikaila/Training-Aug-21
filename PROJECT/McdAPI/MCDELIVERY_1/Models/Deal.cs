using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class Deal
    {
        public int DealsId { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
        public int? ProductId { get; set; }
        public DateTime? DealDate { get; set; }

        public virtual ProductTable Product { get; set; }
    }
}
