using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Day_15.Models
{
    public class Assignment
    {
        [Key]
        public int AssignmentId { get; set; }
        public string ActionReasonCode { get; set; }
        public string ActualTerminationDate { get; set; }
        public string AssignmentCategory { get; set; }
        public string AssignmentName { get; set; }
        public string AssignmentNumber { get; set; }
        public string AssignmentProjectedEndDate { get; set; }
        public string AssignmentStatus { get; set; }
        public long AssignmentStatusTypeId { get; set; }
        public long BusinessUnitId { get; set; }
        public string CreationDate { get; set; }
        public string DefaultExpenseAccount { get; set; }
        public long DepartmentId { get; set; }
        public string EffectiveEndDate { get; set; }
        public string EffectiveStartDate { get; set; }
        public string EndTime { get; set; }
        public string Frequency { get; set; }
        public string FullPartTime { get; set; }
        public long GradeId { get; set; }
        public long GradeLadderID { get; set; }
        public long JobId { get; set; }
        public string LastUpdateDate { get; set; }
        public long LegalEntityId { get; set; }
        public long LocationId { get; set; }
        public long ManagerAssignmentId { get; set; }
        public long ManagerId { get; set; }

        public int EmployeeId { get; set; }
        public Employee Employee { get; set; }
    }
}
