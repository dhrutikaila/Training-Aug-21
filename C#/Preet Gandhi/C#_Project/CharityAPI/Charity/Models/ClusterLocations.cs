using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class ClusterLocations
    {
        public long ClusterLocationId { get; set; }
        public long UserId { get; set; }
        public long PostId { get; set; }
        public long RequirementTypeId { get; set; }
        public string Locations { get; set; }
        public long CityId { get; set; }
        public long StateId { get; set; }
        public long PeopleCount { get; set; }
        public bool IsVerified { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }
        public long PincodeId { get; set; }

        public virtual Cities City { get; set; }
        public virtual Pincode Pincode { get; set; }
        public virtual Post Post { get; set; }
        public virtual RequirementType RequirementType { get; set; }
        public virtual States State { get; set; }
        public virtual UserData User { get; set; }
    }
}
