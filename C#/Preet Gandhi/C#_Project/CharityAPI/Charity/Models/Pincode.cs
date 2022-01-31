using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class Pincode
    {
        public Pincode()
        {
            CharityEvent = new HashSet<CharityEvent>();
            ClusterLocations = new HashSet<ClusterLocations>();
            Post = new HashSet<Post>();
            UserData = new HashSet<UserData>();
        }

        public long PincodeId { get; set; }
        public string PostOfficeName { get; set; }
        public long Pincode1 { get; set; }
        public long CityId { get; set; }
        public string District { get; set; }
        public long StateId { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }

        public virtual Cities City { get; set; }
        public virtual States State { get; set; }
        public virtual ICollection<CharityEvent> CharityEvent { get; set; }
        public virtual ICollection<ClusterLocations> ClusterLocations { get; set; }
        public virtual ICollection<Post> Post { get; set; }
        public virtual ICollection<UserData> UserData { get; set; }
    }
}
