using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class SongArtist
    {
        public int SongId { get; set; }
        public int UserId { get; set; }

        public virtual Song Song { get; set; }
        public virtual User User { get; set; }
    }
}
