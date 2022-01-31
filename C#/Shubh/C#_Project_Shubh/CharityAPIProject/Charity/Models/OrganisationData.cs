using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class OrganisationData
    {
        public OrganisationData()
        {
            CharityEvent = new HashSet<CharityEvent>();
            CharityEventOrganiser = new HashSet<CharityEventOrganiser>();
            Volunteer = new HashSet<Volunteer>();
        }

        public long OrganisationDataId { get; set; }
        public long OrganisationUserId { get; set; }
        public string OrganisationName { get; set; }
        public string OrganisationAddress { get; set; }
        public string OrganisationContactNo { get; set; }
        public string OrganisationLogoUrl { get; set; }
        public bool IsVerified { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }

        public virtual Organisations OrganisationUser { get; set; }
        public virtual ICollection<CharityEvent> CharityEvent { get; set; }
        public virtual ICollection<CharityEventOrganiser> CharityEventOrganiser { get; set; }
        public virtual ICollection<Volunteer> Volunteer { get; set; }
    }
}
