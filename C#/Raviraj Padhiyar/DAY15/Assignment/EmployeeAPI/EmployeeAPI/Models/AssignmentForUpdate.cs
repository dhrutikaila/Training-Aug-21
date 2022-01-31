using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeAPI.Models
{
    public class AssignmentForUpdate
    {
        public long AssignmentId { get; set; }

        [MaxLength(30)]
        public string ActionCode { get; set; }

        [MaxLength(30)]
        public string ActionReasonCode { get; set; }


        public DateTime ActualTerminationDate { get; set; }

        [MaxLength(30)]
        public string AssignmentCategory { get; set; }


        [MaxLength(80)]
        public string AssignmentName { get; set; }

        [MaxLength(30)]
        public string AssignmentNumber { get; set; }

        public DateTime AssignmentProjectEndDate { get; set; }

        [MaxLength(30)]
        public string AssignmentStatus { get; set; }

        public long AssignmentStatusTypeId { get; set; }

        public long BuisnessUnitID { get; set; }

        public DateTime CreationDate { get; set; }

        public string DefualtExpenseAccount { get; set; }

        public long DepartmentId { get; set; }

        public DateTime EffectiveEndDate { get; set; }

        public DateTime EffectiveStartDate { get; set; }

        [MaxLength(5)]
        public string EndTime { get; set; }

        [MaxLength(30)]
        public string Frequency { get; set; }

        [MaxLength(30)]
        public string FullPartTime { get; set; }
        public long GradeID { get; set; }
        public long GradeLadderId { get; set; }

        public long JobId { get; set; }
        public DateTime LastUpdateDate { get; set; }
        public long LegalEntityID { get; set; }

        public long LocationID { get; set; }

        public long ManagerAssignmentId { get; set; }
        public long ManagerID { get; set; }

        public Guid EmployeeId { get; set; }
        public Employee Employee { get; set; }
    }
}
