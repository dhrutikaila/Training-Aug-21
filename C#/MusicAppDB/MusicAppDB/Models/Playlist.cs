using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class Playlist
    {
        public Playlist()
        {
            PlaylistPodcasts = new HashSet<PlaylistPodcast>();
            PlaylistSongs = new HashSet<PlaylistSong>();
        }

        public int PlaylistId { get; set; }
        public int UserId { get; set; }
        public string Title { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }

        public virtual Users User { get; set; }
        public virtual ICollection<PlaylistPodcast> PlaylistPodcasts { get; set; }
        public virtual ICollection<PlaylistSong> PlaylistSongs { get; set; }
    }
}
