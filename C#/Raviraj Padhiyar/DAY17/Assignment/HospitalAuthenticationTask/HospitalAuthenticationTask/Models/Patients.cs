﻿using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace HospitalAuthenticationTask.Models
{
    public partial class Patients
    {
        public Patients()
        {
            Prescribes = new HashSet<Prescribes>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public virtual ICollection<Prescribes> Prescribes { get; set; }
    }
}
