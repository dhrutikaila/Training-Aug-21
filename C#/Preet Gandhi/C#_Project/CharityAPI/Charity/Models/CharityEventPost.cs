using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class CharityEventPost
    {
        public CharityEventPost()
        {
            CharityEventPostLike = new HashSet<CharityEventPostLike>();
        }

        public long CharityEventPostId { get; set; }
        public long EventId { get; set; }
        public long UserId { get; set; }
        public string PostUrl { get; set; }
        public string Content { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }

        public virtual CharityEvent Event { get; set; }
        public virtual UserData User { get; set; }
        public virtual ICollection<CharityEventPostLike> CharityEventPostLike { get; set; }
    }
}
