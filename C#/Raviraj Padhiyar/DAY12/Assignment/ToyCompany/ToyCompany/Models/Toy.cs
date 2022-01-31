using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyCompany.Models
{
    class Toy
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [MaxLength(32)]
        public string ToyName { get; set; }
        [Required]
        public decimal Price { get; set; }
        [Required]
        public int TypeId { get; set; }
        public ToyType Type { get; set; }
    }
}
