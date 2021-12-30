using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class UserTable
    {
        public UserTable()
        {
            Carts = new HashSet<Cart>();
            Orders = new HashSet<Order>();
        }

        public int UsersId { get; set; }
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public string Pwd { get; set; }
        public int? OrderId { get; set; }

        public virtual Order Order { get; set; }
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
