using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Hospital_Mange.Models
{
    public partial class States
    {
        public States()
        {
            City = new HashSet<City>();
        }

        public int StateId { get; set; }
        public string StateName { get; set; }

        public virtual ICollection<City> City { get; set; }
    }
}
