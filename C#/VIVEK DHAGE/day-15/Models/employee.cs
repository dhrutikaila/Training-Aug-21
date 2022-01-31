using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Day15_2.Models
{
    public class employee
    {
        [Key]
        public int employee_id { get; set; }
        public string? AddressLine1 { get; set; }
        public string? AddressLine2 { get; set; }
        public string? AddressLine3 { get; set; }
        public int? CitizenshipId { get; set; }
        public string? CitizenshipLegislationCode { get; set; }
        public string? CitizenshipStatus { get; set; }
        public DateTime? CitizenshipToDate { get; set; }
        public string? City { get; set; }
        public string? CorrespondenceLanguage { get; set; }
        public string? Country { get; set; }
        public DateTime? CreationDate { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string? DisplayName { get; set; }
        public DateTime? DriversLicenseExpirationDate { get; set; }
        public int? DriversLicenseId { get; set; }
        public string? DriversLicenseIssuingCountry { get; set; }
        public DateTime? EffectiveStartDate { get; set; }
        public string? Ethnicity { get; set; }
        public string? FirstName { get; set; }
        public string? Gender { get; set; }
        public DateTime? HireDate { get; set; }
        public string? HomeFaxAreaCode { get; set; }
        public string? HomePhoneCountryCode { get; set; }
        public string? HomeFaxExtension { get; set; }
        public string? HomePhoneLegislationCode { get; set; }
        public string? HomePhoneNumber { get; set; }
        public string? Honors { get; set; }
        public string? LastName { get; set; }
        public DateTime? LastUpdateDate { get; set; }
        public int? LegalEntityId { get; set; }
        public string? LicenseNumber { get; set; }
        public string? MaritalStatus { get; set; }
        public string? MiddleName { get; set; }
        public string? MilitaryVetStatus { get; set; }
        public string? NameSuffix { get; set; }
        public string? NationalId { get; set; }
        public string? MyProNationalIdCountryperty { get; set; }

        [NotMapped]
        public string[]? assignmnets { get; set; }
        [NotMapped]
        public string[]? links { get; set; }
        [NotMapped]
        public string[]? directReports { get; set; }




        //public List<assignment> ass = new List<assignment>() { };
        //public List<employee> GetAssignments()
        //{

        //    return assignment.ToList();
        //}
    }

    
}
