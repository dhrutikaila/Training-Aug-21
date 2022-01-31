using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Day12_13.Models
{
    class PurchaseDetail
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
