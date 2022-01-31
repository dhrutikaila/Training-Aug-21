using System;
using System.Collections.Generic;

#nullable disable

namespace MCDELIVERY_1.Models
{
    public partial class Address
    {
        public int? UsersId { get; set; }
        public string UserAddress { get; set; }

        public virtual UserTable Users { get; set; }
    }
}
