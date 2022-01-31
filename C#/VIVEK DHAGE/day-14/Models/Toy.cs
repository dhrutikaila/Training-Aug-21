using System;
using System.Collections.Generic;

#nullable disable

namespace TOY_API_DAY14_1.Models
{
    public partial class Toy
    {
        public int ToyId { get; set; }
        public string ToyName { get; set; }
        public int ToyPrice { get; set; }
        public string ToyCategory { get; set; }
        public int? PlantId { get; set; }

        public virtual Plant Plant { get; set; }
    }
}
