using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MusicAppDB.Models
{
    public partial class User
    {

        public User()
        {
           // MovieBookings = new HashSet<MovieBooking>();
           // EventBookings = new HashSet<EventBooking>();
        }
        [Key]
        public int UserId { get; set; }
        public string ContactNo { get; set; }
        public string Password { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public int Otp { get; set; }

        //public ApplicationUser Users { get; set; }
        //public string registeredUserid { get; set; }

       
    }
}
