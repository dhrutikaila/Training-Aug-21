using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class Toy
    {
        [Key]
        public int ToyId { get; set; }
        [Required]
        public string ToyName { get; set; }
        [Required]
        public int ToyPrice { get; set; }

        public int PlantId { get; set; }
        public Plant Plant { get; set; }

        public ICollection<PurchasedToy> PurchasedToys { get; set; }
    }
}