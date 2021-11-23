using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeData.Models
{
    public class Employee
    {
        [Key]
        public Guid id { get; set; }
        public object Id { get; internal set; }
        [Required]
        [MaxLength(10,ErrorMessage ="Name can only be 10 ")]
        public string Name { get; set; }
    }
}
