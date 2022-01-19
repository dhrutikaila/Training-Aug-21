using System.ComponentModel.DataAnnotations;
using APISPOTIFY.Authentication;
using System;
using System.Collections.Generic;
#nullable disable
namespace APISPOTIFY.Models
{
    public partial class Admin
    {
        [Key]
        public int AdminId { get; set; }
        public string ContactNo { get; set; }
        public string Password { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }

    }
}