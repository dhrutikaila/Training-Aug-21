using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class PodcastLike
    {
        public int UserId { get; set; }
        public int PodcastId { get; set; }

        public virtual Podcast Podcast { get; set; }
        public virtual User User { get; set; }
    }
}
