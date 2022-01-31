using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Day15.Models
{
    public partial class Employee
    {
        public Employee()
        {
            Assignment = new HashSet<Assignment>();
        }

        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string AddressLine3 { get; set; }
        public int? CitizenshipId { get; set; }
        public string CitizenshipLegislationCode { get; set; }
        public string CitizenshipStatus { get; set; }
        public DateTime? CitizenshipToDate { get; set; }
        public string City { get; set; }
        public string CorrespondenceLanguage { get; set; }
        public string Country { get; set; }
        public DateTime? CreationDate { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string DisplayName { get; set; }
        public DateTime? DriversLicenseExpirationDate { get; set; }
        public string DriversLicenseId { get; set; }
        public string DriversLicenseIssuingCountry { get; set; }
        public DateTime? EffectiveStartDate { get; set; }
        public string Ethnicity { get; set; }
        public string Gender { get; set; }
        public DateTime? HireDate { get; set; }
        public string HomeFaxAreaCode { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Assignment> Assignment { get; set; }
    }
}
