using System;
using System.Collections.Generic;

#nullable disable

namespace Doctor_Api.Models
{
    public partial class Patient
    {
        public Patient()
        {
            Prescriptions = new HashSet<Prescription>();
            Treatments = new HashSet<Treatment>();
        }

        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public byte Age { get; set; }
        public byte Gender { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public string BloodGroup { get; set; }

        public virtual ICollection<Prescription> Prescriptions { get; set; }
        public virtual ICollection<Treatment> Treatments { get; set; }
    }
}
