using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Day12_13.Models
{
    class Order
    {
        [Key]
        public int OrderId { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal TotalDiscount { get; set; }
        public decimal NetAmount { get; set; }
        [ForeignKey("CustomerAddress")]
        public int AddressId { get; set; }
        public CustomerAddress CustomerAddress { get; set; }
    }
}
