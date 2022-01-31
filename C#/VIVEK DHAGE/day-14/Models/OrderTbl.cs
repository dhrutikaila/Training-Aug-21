using System;
using System.Collections.Generic;

#nullable disable

namespace TOY_API_DAY14_1.Models
{
    public partial class OrderTbl
    {
        public int OrderId { get; set; }
        public int Amount { get; set; }
        public int Discount { get; set; }
        public int NetAmount { get; set; }
        public DateTime OrderDate { get; set; }
        public int? CustomerId { get; set; }
        public int AddressId { get; set; }

        public virtual Customer Customer { get; set; }
    }
}
