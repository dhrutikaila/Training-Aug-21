using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class RequirementType
    {
        public RequirementType()
        {
            ClusterLocations = new HashSet<ClusterLocations>();
            Post = new HashSet<Post>();
        }

        public long RequirementTypeId { get; set; }
        public string RequirementTypeName { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }

        public virtual ICollection<ClusterLocations> ClusterLocations { get; set; }
        public virtual ICollection<Post> Post { get; set; }
    }
}
