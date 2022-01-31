using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class PurchaseDetail
    {
        [Key]
        public int PurchaseId { get; set; }
        [ForeignKey("Toy")]
        public int ToyId { get; set; }
        public Toy Toy { get; set; }

        [ForeignKey("Order")]
        public int OrderId { get; set; }
        public Order Order { get; set; }
        public int Quantity { get; set; }
    }
}
