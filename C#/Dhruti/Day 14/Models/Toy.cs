using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ToyShop.Models
{

   public class Toy
    {
        public int ToysId { get; set; }

        [Required]
        [MaxLength(25)]
        public string ToyName { get; set; }

        public int UnitPrice { get; set; }

        public int ToyQuantity { get; set; }

        public bool AvailabilityStatus { get; set; }

        public int PlantId { get; set; }
        public ToyPlant Plant { get; set; }

        public ICollection<Order> OrderItems { get; set; }
    }
}
