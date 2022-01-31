using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class Plant
    {
        [Key]
        public int PlantId { get; set; }
        [Required]
        public string PlantAddress { get; set; }
        [Required]
        public int PlantPincode { get; set; }

        public ICollection<Toy> Toy { get; set; }
    }
}
