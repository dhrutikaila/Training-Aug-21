using System;
using System.Collections.Generic;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class Album
    {
        public Album()
        {
            AlbumLikes = new HashSet<AlbumLike>();
            Songs = new HashSet<Song>();
        }

        public int AlbumId { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Picture { get; set; }
        public string Description { get; set; }
        public bool? Premium { get; set; }
        public bool? Active { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public DateTime? DeletedOn { get; set; }

        public virtual User User { get; set; }
        public virtual ICollection<AlbumLike> AlbumLikes { get; set; }
        public virtual ICollection<Song> Songs { get; set; }
    }
}
