using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace ToyCompany.API.Models
{
    public partial class ToyTypes
    {
        public ToyTypes()
        {
            ToyProductions = new HashSet<ToyProductions>();
            Toys = new HashSet<Toys>();
        }

        public int Id { get; set; }
        public string TypeName { get; set; }

        public virtual ICollection<ToyProductions> ToyProductions { get; set; }
        public virtual ICollection<Toys> Toys { get; set; }
    }
}
