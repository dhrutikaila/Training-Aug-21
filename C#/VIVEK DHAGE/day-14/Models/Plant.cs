using System;
using System.Collections.Generic;

#nullable disable

namespace TOY_API_DAY14_1.Models
{
    public partial class Plant
    {
        public Plant()
        {
            Toys = new HashSet<Toy>();
        }

        public int Plantid { get; set; }
        public string PlantName { get; set; }
        public string PlantAddress { get; set; }
        public int PlantPincode { get; set; }

        public virtual ICollection<Toy> Toys { get; set; }
    }
}
