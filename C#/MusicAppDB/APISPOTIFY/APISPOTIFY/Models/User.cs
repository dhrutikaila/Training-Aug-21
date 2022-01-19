using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace APISPOTIFY.Models
{
    public partial class User
    {
        public User()
        {
            AlbumLikes = new HashSet<AlbumLike>();
            Albums = new HashSet<Album>();
            Payments = new HashSet<Payment>();
            Playlists = new HashSet<Playlist>();
            PodcastLikes = new HashSet<PodcastLike>();
            Podcasts = new HashSet<Podcast>();
            SongArtists = new HashSet<SongArtist>();
            SongLikes = new HashSet<SongLike>();
            Subscriptions = new HashSet<Subscription>();
            UserLanguages = new HashSet<UserLanguage>();
        }
       
        public int UserId { get; set; }
       

        //   public string FirstName { get; set; }
        public string Contactno { get; set; }
      //  public string LastName { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int Otp { get; set; }
     
       // public DateTime CreatedOn { get; set; }
     
      
        public virtual Profile Profile { get; set; }
        public virtual ICollection<AlbumLike> AlbumLikes { get; set; }
        public virtual ICollection<Album> Albums { get; set; }
        public virtual ICollection<Payment> Payments { get; set; }
        public virtual ICollection<Playlist> Playlists { get; set; }
        public virtual ICollection<PodcastLike> PodcastLikes { get; set; }
        public virtual ICollection<Podcast> Podcasts { get; set; }
        public virtual ICollection<SongArtist> SongArtists { get; set; }
        public virtual ICollection<SongLike> SongLikes { get; set; }
        public virtual ICollection<Subscription> Subscriptions { get; set; }
        public virtual ICollection<UserLanguage> UserLanguages { get; set; }
        public virtual ICollection<Role> Role { get;  set; }
    }
}
