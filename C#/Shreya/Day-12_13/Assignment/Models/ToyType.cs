using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Day12_13.Models
{
    class ToyType
    {
        [Key]
        public int ToyTypeId { get; set; }
        public string TypeName { get; set; }
        [ForeignKey("Plant")]
        public int PlantId { get; set; }
        public Plant Plant { get; set; }
    }
}
