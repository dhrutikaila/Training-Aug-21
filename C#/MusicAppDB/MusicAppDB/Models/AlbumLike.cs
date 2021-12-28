using System;
using System.Collections.Generic;

#nullable disable

namespace MusicAppDB.Models
{
    public partial class AlbumLike
    {
        public int UserId { get; set; }
        public int AlbumId { get; set; }

        public virtual Album Album { get; set; }
        public virtual Users User { get; set; }
    }
}
