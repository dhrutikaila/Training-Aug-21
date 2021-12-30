using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CourseLibarary.API.Models
{
    public class CourseForCreationDto : IValidatableObject
    {
        [Required]
        [MaxLength(100)]
        public string Title { get; set; }

        [MaxLength(1500)]
        public string Desciption { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if(Title == Desciption)
            {
                yield return new ValidationResult(
                    "The provided description should be diffrent from the the title. ",
                    new[] { "CourseForCreationDto" }
                    );
            }
        }
    }
}
