using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class Post
    {
        public Post()
        {
            ClusterLocations = new HashSet<ClusterLocations>();
            Spam = new HashSet<Spam>();
            Urgency = new HashSet<Urgency>();
        }

        public long PostId { get; set; }
        public long UserId { get; set; }
        public string PostDescription { get; set; }
        public long RequirementTypeId { get; set; }
        public string LocationName { get; set; }
        public decimal Longitude { get; set; }
        public decimal Latitude { get; set; }
        public long HelpRequiredCount { get; set; }
        public long CityId { get; set; }
        public long StateId { get; set; }
        public string ImageUrl { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }
        public bool IsClosed { get; set; }
        public DateTime CloseAt { get; set; }
        public long PincodeId { get; set; }

        public virtual Cities City { get; set; }
        public virtual Pincode Pincode { get; set; }
        public virtual RequirementType RequirementType { get; set; }
        public virtual States State { get; set; }
        public virtual UserData User { get; set; }
        public virtual ICollection<ClusterLocations> ClusterLocations { get; set; }
        public virtual ICollection<Spam> Spam { get; set; }
        public virtual ICollection<Urgency> Urgency { get; set; }
    }
}
