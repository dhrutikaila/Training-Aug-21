using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Vaddress
    {
        public int AddressId { get; set; }
        public string Addressline1 { get; set; }
        public string AddressLine2 { get; set; }
        public long ContactNumber { get; set; }
        public string CityName { get; set; }
        public string StateCode { get; set; }
        public int PostalCode { get; set; }
    }
}
