using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Day12_13.Models
{
    class Toy
    {
        [Key]
        public int ToyId { get; set; }
        public string ToyName { get; set; }
        [ForeignKey("ToyType")]
        public int ToyTypeId { get; set; }
        public ToyType ToyType { get; set; }

        public decimal Price { get; set; }
    }
}
