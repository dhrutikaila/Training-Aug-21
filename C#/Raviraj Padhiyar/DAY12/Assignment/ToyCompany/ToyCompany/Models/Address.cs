using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyCompany.Models
{
    class Address
    {
        [Key]
        public int Id { get; set; }
        
        [Required]
        [MaxLength(32)]
        public string City { get; set; }
        
        [Required]
        [MaxLength(32)]
        public string State { get; set; }

    }
}
