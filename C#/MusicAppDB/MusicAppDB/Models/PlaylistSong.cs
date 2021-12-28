using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class PlaylistSong
    {
        public int PlaylistId { get; set; }
        public int SongId { get; set; }

        public virtual Playlist Playlist { get; set; }
        public virtual Song Song { get; set; }
    }
}
