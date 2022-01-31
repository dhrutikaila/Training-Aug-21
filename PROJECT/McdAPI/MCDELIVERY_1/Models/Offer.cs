using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class Offer
    {
        public int OfferId { get; set; }
        public string Name { get; set; }
        public int? ProductId { get; set; }
        public int? OfferPrice { get; set; }

        public virtual ProductTable Product { get; set; }
    }
}
