using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace EFDataAccessLibrary.Models
{
    public class Email
    {
        public int ID { get; set; }

        [Required]
        [MaxLength(100)]
        public string EmailAddress { get; set; }

    }
}
