using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        public int TotalAmount { get; set; }
        public int DiscountAmount { get; set; }
        public int NetAmount { get; set; }

        public int CustomerAddressId { get; set; }
        public CustomerAddress CustomerAddress { get; set; }

        public ICollection<PurchasedToy> PurchasedToys { get; set; }
    }
}