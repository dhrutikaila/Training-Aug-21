using System;
using System.Collections.Generic;

#nullable disable

namespace Day_10.Models
{
    public partial class Doctor
    {
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public int? DepartmentId { get; set; }

        public virtual Department Department { get; set; }
        public string name;
        public int dept_id;
        public void doctors()
        {
           
            Console.WriteLine("Enter Doctorname");
            name = Console.ReadLine();
            Console.WriteLine("Enter Departmenr Id");
            dept_id = Convert.ToInt32(Console.ReadLine());
        }
    }
   
}
