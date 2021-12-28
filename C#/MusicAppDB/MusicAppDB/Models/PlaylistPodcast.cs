using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class PlaylistPodcast
    {
        public int PlaylistId { get; set; }
        public int PodcastId { get; set; }

        public virtual Playlist Playlist { get; set; }
        public virtual Podcast Podcast { get; set; }
    }
}
