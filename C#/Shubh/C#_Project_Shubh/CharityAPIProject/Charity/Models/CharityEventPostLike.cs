using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class CharityEventPostLike
    {
        public long CharityEventPostLikeId { get; set; }
        public long CharityEventPostId { get; set; }
        public long UserId { get; set; }
        public bool Likes { get; set; }
        public bool DisLike { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }

        public virtual CharityEventPost CharityEventPost { get; set; }
        public virtual UserData User { get; set; }
    }
}
