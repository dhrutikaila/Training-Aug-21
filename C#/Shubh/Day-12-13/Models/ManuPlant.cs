using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day12.ToyModels
{
    public class ManuPlant
    {
        [Key]
        public int PlantId { get; set; }
        public string PlantName { get; set; }
        public string Address { get; set; }
        public int Pincode { get; set; }

        public ICollection<Toy> Toys { get; set; }
        public bool IsActive { get; set; }
    }
}
