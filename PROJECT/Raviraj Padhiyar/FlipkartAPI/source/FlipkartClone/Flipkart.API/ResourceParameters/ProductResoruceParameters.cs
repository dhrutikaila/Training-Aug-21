using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Flipkart.API.ResourceParameters
{
    public class ProductResoruceParameters
    {
        public string start { get; set; }
        public string count { get; set; }
        public string CategoryQuery { get; set; }
        public string SubCatgoryQuery { get; set; }
        public string brandQuery { get; set; }
        public string minPrice { get; set; }
        public string maxPrice { get; set; }
        public string discountQuery { get; set; }
        public bool IsActive { get; set; }
    }
}
