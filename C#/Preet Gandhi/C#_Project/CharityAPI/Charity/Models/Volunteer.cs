using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class Volunteer
    {
        public long VolunteerId { get; set; }
        public long VolunteerUserId { get; set; }
        public long OrganisationId { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }

        public virtual OrganisationData Organisation { get; set; }
        public virtual UserData VolunteerUser { get; set; }
    }
}
