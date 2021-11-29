using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Doctor_Api.Models
{
    
        public partial class ObjectMaster
        {
            public ObjectMaster()
            {
                Objects = new HashSet<Object>();
            }

            public int TypeId { get; set; }
            public string TypeName { get; set; }

            public virtual ICollection<Object> Objects { get; set; }
        }
    
}
