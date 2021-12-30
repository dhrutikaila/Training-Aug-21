using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseLibarary.API.Models
{
    public class AuthorForCreationDto
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTimeOffset DataOfBirth { get; set; }
        public string MainCategory { get; set; }

        public ICollection<CourseForCreationDto> Courses { get; set; }
         = new List<CourseForCreationDto>();
    }
}
