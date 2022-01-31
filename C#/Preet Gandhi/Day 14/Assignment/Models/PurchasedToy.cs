using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class PurchasedToy
    {
        [Key]
        public int PurchasedToyId { get; set; }
        public int OrderId { get; set; }
        public Order Order { get; set; }

        public int ToyId { get; set; }
        public Toy Toy { get; set; }
        [Required]
        public int ToyQuantity { get; set; }
    }
}
