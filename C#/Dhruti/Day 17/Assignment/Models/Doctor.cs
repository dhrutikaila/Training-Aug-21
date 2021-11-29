using System;
using System.Collections.Generic;

#nullable disable

namespace Doctor_Api.Models
{
    public partial class Doctor
    {
        public Doctor()
        {
            Prescriptions = new HashSet<Prescription>();
            Treatments = new HashSet<Treatment>();
        }

        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public byte Age { get; set; }
        public byte Gender { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }

        public virtual ICollection<Prescription> Prescriptions { get; set; }
        public virtual ICollection<Treatment> Treatments { get; set; }
        public bool IsActive { get;  set; }
    }
}
