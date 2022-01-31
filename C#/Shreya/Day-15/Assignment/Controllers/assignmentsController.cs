using Day_15_Assignment.Models;
using Day_15_Assignment.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_15_Assignment.Controllers
{
    //[Route("emps/{empID}/child/assignments")]
    [ApiController]
    public class assignmentsController : ControllerBase
    {
        private readonly IAssignment _assignment;
        public assignmentsController(IAssignment assignment)
        {
            _assignment = assignment;
        }
        [HttpGet]
        [Route("emps/{empID}/child/assignments")]
        public IActionResult GetAssignments(int empId)
        {
            var assignment = _assignment.GetAssignments(empId);
            if(assignment == null)
            {
                return NotFound($"Data with this {empId} is not found");
            }
            return Ok(assignment);
        }
        [HttpGet]
        [Route("emps/{empID}/child/assignments/{AssignmentID}")]
        public IActionResult GetAssignment(int empID, int AssignmentID)
        //For Get an Assignment for Perticular empID
        {
            var assignment = _assignment.GetAssignment(empID, AssignmentID);
            if (assignment == null)
            {
                return NotFound($"Data with this {AssignmentID} is not found");
            }
            return Ok(assignment);
        }
        [HttpPost]
        [Route("emps/{empID}/child/assignments")]
        public IActionResult GetAssignment(int empId , Assignment assignment)
        {
            assignment.EmployeesId = empId;
            _assignment.AddAssignment(empId, assignment);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + assignment.EmployeesId
                , assignment);
        }

        [HttpPatch]
        [Route("emps/{empID}/child/assignments/{AssignmentID}")]
        public IActionResult UpdateAssignment(int empId,int assignmentId, Assignment assignment)
        {
            assignment.AssignmentId = assignmentId;
            assignment.EmployeesId = empId;
            var ExistingAssignment = _assignment.UpdateAssignment(empId, assignmentId, assignment);
            if(ExistingAssignment == null)
            {
                return NotFound($"Employee with this id {assignmentId} was not found");
            }
            return Ok(assignment);
        }
    }
}
