using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
            UserTables = new HashSet<UserTable>();
        }

        public int OrderId { get; set; }
        public int? Netpay { get; set; }
        public DateTime? OrderDate { get; set; }
        public int? UsersId { get; set; }

        public virtual UserTable Users { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<UserTable> UserTables { get; set; }
    }
}
