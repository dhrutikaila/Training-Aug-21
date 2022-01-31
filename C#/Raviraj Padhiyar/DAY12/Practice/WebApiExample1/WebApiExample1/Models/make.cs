using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApiExample1.Models
{
    public class Make
    {
        public int ID { get; set; }

        [Required]
        [StringLength(255)]
        public string Name { get; set; }

        public IList<Model> Models { get; set; }

        public Make()
        {
            Models = new List<Model>();
        }
    }
}
