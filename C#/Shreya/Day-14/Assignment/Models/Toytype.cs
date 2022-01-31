using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class Toytype
    {
        [Key]
        public int ToyTypeId { get; set; }
        [Required]
        [MaxLength(20, ErrorMessage = "Name can only be 20 character")]
        public string TypeName { get; set; }
    }
}
