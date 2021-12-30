using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ToyCompany.API.Models
{
    public partial class ManufacturingPlants
    {
        public ManufacturingPlants()
        {
            ToyProductions = new HashSet<ToyProductions>();
        }

        public int Id { get; set; }
        public int AddressId { get; set; }

        public virtual Addresses Address { get; set; }
        public virtual ICollection<ToyProductions> ToyProductions { get; set; }
    }
}
