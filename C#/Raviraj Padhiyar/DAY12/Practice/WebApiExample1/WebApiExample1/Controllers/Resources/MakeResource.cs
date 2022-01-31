using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApiExample1.Controllers.Resources
{
    public class MakeResource
    {
        public int ID { get; set; }

        
        public string Name { get; set; }

        public IList<ModelResource> Models { get; set; }

        public MakeResource()
        {
            Models = new List<ModelResource>();
        }
    }
}
