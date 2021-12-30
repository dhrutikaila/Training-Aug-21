using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class AddressDto
    {
        public int AddressId { get; set; }
        public string Addressline1 { get; set; }
        public string AddressLine2 { get; set; }
        public long ContactNumber { get; set; }
        public int? CityId { get; set; }
        public string City { get; set; }
        public int? StateId { get; set; }
        public string StateCode { get; set; }
        public int PostalCode { get; set; }
    }
}
