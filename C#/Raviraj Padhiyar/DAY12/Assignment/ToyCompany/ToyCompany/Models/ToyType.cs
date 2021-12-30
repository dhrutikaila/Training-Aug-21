using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyCompany.Models
{
    class ToyType
    {
        [Key]
        public int Id { get; set; }
        
        [Required]
        [MaxLength(32)]
        public string TypeName { get; set; }

    }
}
