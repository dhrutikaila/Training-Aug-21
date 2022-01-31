using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class States
    {
        public States()
        {
            Cities = new HashSet<Cities>();
            ClusterLocations = new HashSet<ClusterLocations>();
            Pincode = new HashSet<Pincode>();
            Post = new HashSet<Post>();
            UserData = new HashSet<UserData>();
        }

        public long StateId { get; set; }
        public string StateName { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }

        public virtual ICollection<Cities> Cities { get; set; }
        public virtual ICollection<ClusterLocations> ClusterLocations { get; set; }
        public virtual ICollection<Pincode> Pincode { get; set; }
        public virtual ICollection<Post> Post { get; set; }
        public virtual ICollection<UserData> UserData { get; set; }
    }
}
