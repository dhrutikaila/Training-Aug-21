using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ToyCompany.API.Models
{
    public partial class Addresses
    {
        public Addresses()
        {
            ManufacturingPlants = new HashSet<ManufacturingPlants>();
            ShippingAddresses = new HashSet<ShippingAddresses>();
        }

        public int Id { get; set; }
        public string City { get; set; }
        public string State { get; set; }

        public virtual ICollection<ManufacturingPlants> ManufacturingPlants { get; set; }
        public virtual ICollection<ShippingAddresses> ShippingAddresses { get; set; }
    }
}
