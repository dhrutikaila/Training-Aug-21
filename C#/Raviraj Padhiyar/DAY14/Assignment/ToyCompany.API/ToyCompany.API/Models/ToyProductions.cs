using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ToyCompany.API.Models
{
    public partial class ToyProductions
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public int ManufacturingPlantId { get; set; }

        public virtual ManufacturingPlants ManufacturingPlant { get; set; }
        public virtual ToyTypes Type { get; set; }
    }
}
