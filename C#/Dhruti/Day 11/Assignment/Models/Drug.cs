using System;
using System.Collections.Generic;

#nullable disable

namespace Hospital_Mange.Models
{
    public partial class Drug
    {
        public Drug()
        {
            Prescriptions = new HashSet<Prescription>();
        }

        public int DrugsId { get; set; }
        public string DrugName { get; set; }
        public decimal Price { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string DrugDescription { get; set; }
        public int Quantity { get; set; }

        public virtual ICollection<Prescription> Prescriptions { get; set; }
    }
}
