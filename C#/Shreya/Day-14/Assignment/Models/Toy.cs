using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Day_14_Assignment.Models
{
    public class Toy
    {
        [Key]
        public int ToyId { get; set; }
        [Required]
        [MaxLength(20, ErrorMessage = "Name can only be 20 character")]
        public string ToyName { get; set; }
        [ForeignKey("ToyType")]
        public int ToyTypeId { get; set; }
        public Toytype ToyType { get; set; }
        public decimal Price { get; set; }
    }
}
