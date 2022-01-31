using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Day_15_Assignment.Models
{
    public class Assignment
    {
        [Key]
        public int AssignmentId { get; set; }
        [ForeignKey("EmployeesId")]
        public Employee Employee { get; set; }
        public int EmployeesId { get; set; }
        public string ActionCode { get; set; }
        public string ActionReasonCode { get; set; }
        public DateTime ActualTerminationDate { get; set; }
        public string AssignmentCategory { get; set; }
        public string AssignmentName { get; set; }
        public string AssignmentNumber { get; set; }
        public DateTime AssignmentProjectedEndDate { get; set; }
        public string AssignmentStatus { get; set; }
        public Int64 AssignmentStatusTypeId { get; set; }
        public Int64 BusinessUnitId { get; set; }
        public DateTime CreationDate { get; set; }
        public string DefaultExpenseAccount { get; set; }
        public Int64 DepartmentId { get; set; }
        public DateTime EffectiveEndDate { get; set; }
        public DateTime EffectiveStartDate { get; set; }
        public string EndTime { get; set; }
        public string Frequency { get; set; }
        public string FullPartTime { get; set; }
        public Int64 GradeId { get; set; }
        public Int64 GradeLadderId { get; set; }
        public Int64 JobId { get; set; }
        public DateTime LastUpdateDate { get; set; }
        public Int64 LegalEntityId { get; set; }
        public Int64 LocationId { get; set; }
        public Int64 ManagerAssignmentId { get; set; }
        public Int64 ManagerId { get; set; }
    }
}
