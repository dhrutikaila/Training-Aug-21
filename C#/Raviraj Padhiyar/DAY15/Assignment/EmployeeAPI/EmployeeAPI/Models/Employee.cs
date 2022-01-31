using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeAPI.Models
{
    public class Employee
    {
        [Key]
        public Guid Id { get; set; }

        [MaxLength(240)]
        public string AddressLine1 { get; set; }

        [MaxLength(240)]
        public string AddressLine2 { get; set; }

        [MaxLength(240)]
        public string AddressLine3 { get; set; }

        public long CitizenShipId { get; set; }

        [MaxLength(30)]
        public string CitizenShipLegislationCode { get; set; }

        [MaxLength(30)]
        public string CitizenShipStatus { get; set; }


        public DateTime CitizenShipToDate { get; set; }

        [MaxLength(30)]
        public string City { get; set; }

        [MaxLength(30)]
        public string CorrespondenceLangauge { get; set; }

        [MaxLength(60)]
        public string Country { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime DateOfBirth { get; set; }

        [MaxLength(240)]
        public string DisplayName { get; set; }

        public DateTime DriversLicenseExpirationDate { get; set; }
        public long DriversLicenseId { get; set; }
        
        [MaxLength(30)]
        public string DriversLicenseIssuingCountry { get; set; }
        public DateTime EffectiveStartDate { get; set; }

        [MaxLength(30)]
        public string Ethnicity { get; set; }

        [MaxLength(150)]
        public string FirstName { get; set; }

        [MaxLength(30)]
        public string Gender { get; set; }
        public DateTime HireDate { get; set; }

        [MaxLength(30)]
        public string HomeFaxAreaCode { get; set; }

        [MaxLength(30)]
        public string HomeFaxCountryCode { get; set; }

        [MaxLength(60)]
        public string HomeFaxExtension { get; set; }

        [MaxLength(4)]
        public string HomeFaxLegislationCode { get; set; }

        [MaxLength(60)]
        public string HomeFaxNumber { get; set; }
        [MaxLength(30)]
        public string HomePhoneAreaCode { get; set; }
        [MaxLength(30)]
        public string HomePhoneCountryCode { get; set; }
        [MaxLength(60)]
        public string HomePhoneExtension { get; set; }
        [MaxLength(4)]
        public string HomePhoneLegislationCode { get; set; }
        [MaxLength(60)]
        public string HomePhoneNumber { get; set; }

        [MaxLength(80)]
        public string Honors { get; set; }

        [MaxLength(150)]
        public string LastName { get; set; }
        public DateTime LastUpdateDate { get; set; }
        public long LegalEntityId { get; set; }

        [MaxLength(150)]
        public string LicenseNumber { get; set; }

        [MaxLength(30)]
        public string MaritalStatus { get; set; }

        [MaxLength(80)]
        public string MiddleName { get; set; }

        [MaxLength(30)]
        public string MilitaryVetStatus { get; set; }

        [MaxLength(80)]
        public string NameSuffix { get; set; }

        [MaxLength(30)]
        public string NationalID { get; set; }

        [MaxLength(30)]
        public string NationalIdCountry { get; set; }

        public ICollection<Assignment> Assignments { get; set; }
            = new List<Assignment>();


    }
}
