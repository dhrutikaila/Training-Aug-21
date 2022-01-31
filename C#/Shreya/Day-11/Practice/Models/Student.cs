using System;
using System.Collections.Generic;
using System.Text;

namespace EFCoreExample.Models
{
    class Student
    {
        public int StudentId { get; set; }
        public string Name { get; set; }
        public int GradeID { get; set; }
        public Grade grade { get; set; }
    }
}
