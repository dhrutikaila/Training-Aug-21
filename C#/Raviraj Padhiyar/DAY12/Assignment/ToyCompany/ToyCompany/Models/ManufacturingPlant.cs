using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyCompany.Models
{
    class ManufacturingPlant
    {
        [Key]
        public int Id { get; set; }
        
        [Required]
        public int AddressId { get; set; }
        public Address Address { get; set; }
    }
}
