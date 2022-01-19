using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Podcast
    {
        public Podcast()
        {
            PlaylistPodcasts = new HashSet<PlaylistPodcast>();
            PodcastLikes = new HashSet<PodcastLike>();
        }

        public int PodcastId { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public int LanguageId { get; set; }
        public string PodcastFile { get; set; }
        public DateTime? StreamedOn { get; set; }
        public decimal Duration { get; set; }
        public bool? Premium { get; set; }
        public bool? Active { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public DateTime? DeletedOn { get; set; }
        public int ViewCount { get; set; }
        public int Downloads { get; set; }

        public virtual Language Language { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<PlaylistPodcast> PlaylistPodcasts { get; set; }
        public virtual ICollection<PodcastLike> PodcastLikes { get; set; }
    }
}
