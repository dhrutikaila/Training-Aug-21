using System;
using System.Collections.Generic;

#nullable disable

namespace Doctor_Api.Models
{
    public partial class Assistance
    {
        public int AssistantId { get; set; }
        public string AssistantName { get; set; }
        public byte Age { get; set; }
        public byte Gender { get; set; }
        public string PhoneNumber { get; set; }
        public decimal? Salary { get; set; }
        public int? DeptNo { get; set; }

        public virtual Department DeptNoNavigation { get; set; }
    }
}
