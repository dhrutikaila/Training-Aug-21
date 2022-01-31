using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class Cart
    {
        public Cart()
        {
            CartDetails = new HashSet<CartDetail>();
        }

        public int CartId { get; set; }
        public int? UsersId { get; set; }
        public DateTime? DatePlaced { get; set; }

        public virtual UserTable Users { get; set; }
        public virtual ICollection<CartDetail> CartDetails { get; set; }
    }
}
