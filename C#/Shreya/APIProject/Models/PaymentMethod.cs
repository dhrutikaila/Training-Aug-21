using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Models
{
    public class PaymentMethod
    {
        [Key]
        public int PaymentTypeId { get; set; }
        public string PaymentType { get; set; }

    }
}
