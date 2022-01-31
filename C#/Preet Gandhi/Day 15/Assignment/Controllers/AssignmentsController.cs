using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_15.AssignmentData;
using Day_15.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Day_15.Controllers
{
    
    [ApiController]
    public class AssignmentsController : ControllerBase
    {
        private readonly IAssignmentData _assignmentData;
        public AssignmentsController(IAssignmentData assignmentData)
        {
            _assignmentData = assignmentData;
        }

        [HttpGet]
        [Route("api/emps/{employeeid}/child/assignments")]
        public IActionResult GetAssignments([FromRoute] int employeeid)
        {
            return Ok(_assignmentData.GetAssignments(employeeid));
        }

        [HttpGet]
        [Route("api/emps/{employeeid}/child/assignments/{assignmentid}")]
        public IActionResult GetAssignment(int assignmentid, [FromRoute] int employeeid)
        {
            var assignment = _assignmentData.GetAssignment(assignmentid, employeeid);

            if (assignment != null)
            {
                return Ok(assignment);
            }
            return NotFound($"Assignment with id: {assignmentid} was not found.");
        }

        //[HttpPost]
        //[Route("api/emps/{employeeid}/child/assignments")]
        //public IActionResult AddAssignment(Assignment assignment)
        //{
        //    _assignmentData.AddAssignment(assignment);
        //    return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + assignment.AssignmentId, assignment);
        //}

        [HttpDelete]
        [Route("api/emps/{employeeid}/child/assignments/{assignmentid}")]
        public IActionResult DeleteAssignment(int assignmentid, [FromRoute] int employeeid)
        {
            var assignment = _assignmentData.GetAssignment(assignmentid, employeeid);

            if (assignment != null)
            {
                _assignmentData.DeleteAssignment(assignment);
                return Ok();
            }

            return NotFound($"Assignment with id: {assignmentid} was not found.");
        }

        [HttpPatch]
        [Route("api/emps/{employeeid}/child/assignments/{assignmentid}")]
        public IActionResult EditAssignment(int assignmentid, [FromRoute] int employeeid, Assignment assignment)
        {
            var existingAssignment = _assignmentData.GetAssignment(assignmentid, employeeid);

            if (existingAssignment != null)
            {
                assignment.AssignmentId = existingAssignment.AssignmentId;
                _assignmentData.EditAssignment(assignment);
            }

            return Ok(assignment);
        }
    }
}
