using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class ProductTable
    {
        public ProductTable()
        {
            CartDetails = new HashSet<CartDetail>();
            Deals = new HashSet<Deal>();
            Offers = new HashSet<Offer>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int ProductId { get; set; }
        public string Name { get; set; }
        public int? Price { get; set; }
        public int? Calories { get; set; }
        public string Categorie { get; set; }
        public string ProductDescription { get; set; }

        public virtual ICollection<CartDetail> CartDetails { get; set; }
        public virtual ICollection<Deal> Deals { get; set; }
        public virtual ICollection<Offer> Offers { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
