using System;
using System.Collections.Generic;

#nullable disable

namespace HospitalTask.Models
{
    public partial class Medication
    {
        public int Id { get; set; }
        public int? PrescribeId { get; set; }
        public int? DrugId { get; set; }
        public int Qunatity { get; set; }
        public int? DayPartId { get; set; }

        public virtual DayPart DayPart { get; set; }
        public virtual Drug Drug { get; set; }
        public virtual Prescribe Prescribe { get; set; }
    }
}
