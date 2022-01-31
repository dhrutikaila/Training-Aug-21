using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalAuthenticationTask.Models
{
    public class DoctorFroCreationDto
    {
        [Required (ErrorMessage = "FirstName is required")]
        public string FirstName { get; set; }
        
        [Required(ErrorMessage = "lastName is required")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Department Id is required")]
        public int? DepartmentId { get; set; }
    }
}
