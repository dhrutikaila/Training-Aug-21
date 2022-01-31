using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.DTOs
{
    public class CityCreationDto
    {
        public string CityName { get; set; }
        public int? StateId { get; set; }
    }
}
