using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyShop.Models
{
   
   
 public       class ToyPlant
        {
        public int PlantId { get; set; }

        [Required]
        [MaxLength(25)]
        public string PlantName { get; set; }

        [Required]
        [MaxLength(50)]
        public string PlantAddress { get; set; }

        [Required]
        [MaxLength(6)]
        public string Pincode { get; set; }

        [Required]
        [MaxLength(25)]
        public string State { get; set; }

        [Required]
        [MaxLength(50)]
        public string Country { get; set; }

        public ICollection<Toy> Toys { get; set; }
    }
    
}
