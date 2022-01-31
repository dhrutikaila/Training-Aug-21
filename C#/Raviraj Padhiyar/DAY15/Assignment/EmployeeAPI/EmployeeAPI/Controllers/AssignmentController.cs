using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using EmployeeAPI.Models;
using EmployeeAPI.Repository;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeAPI.Controllers
{
    [ApiController]
    [Route("api/emps/{empID}/child/Assignments")]
    public class AssignmentController : ControllerBase
    {
        private readonly IEmployeeAPIRepostiory _employeeAPIRepository;
        private readonly IMapper _mapper;

        public AssignmentController(IEmployeeAPIRepostiory employeeAPIRepostiory, IMapper mapper)
        {
            _employeeAPIRepository = employeeAPIRepostiory ??
                throw new ArgumentNullException(nameof(employeeAPIRepostiory));
            _mapper = mapper ??
                throw new ArgumentNullException(nameof(mapper));
        }

        [HttpGet()]
        public ActionResult<IEnumerable<Assignment>> GetAssignments(Guid empId)
        {
            if (!_employeeAPIRepository.EmployeeExists(empId))
            {
                return NotFound();
            }

            var AssignmentFromRepo = _employeeAPIRepository.GetAssignments(empId);
            return Ok(AssignmentFromRepo);
        }

        [HttpGet("{assignmentId}")]
        public ActionResult<Assignment> GetAssignmentForEmployee(Guid empId, Guid assignmentId)
        {
            if (!_employeeAPIRepository.EmployeeExists(empId))
            {
                return NotFound();
            }

            var assignmentFromEmployeeRepo = _employeeAPIRepository.GetAssignment(empId, assignmentId);

            return Ok(assignmentFromEmployeeRepo);
        }

        [HttpPut]
        public ActionResult UpdateAssignmentForEmployee(Guid empId, Guid assignmentId,AssignmentForUpdate assignment )
        {
            if (!_employeeAPIRepository.EmployeeExists(empId))
            {
                return NotFound();
            }
            var assignmentFromEmployeeRepo = _employeeAPIRepository.GetAssignment(empId, assignmentId);

            if(assignmentFromEmployeeRepo == null)
            {
                return NotFound();
            }

            _mapper.Map(assignment, assignmentFromEmployeeRepo);

            _employeeAPIRepository.Save();

            return NoContent();

        }






    }
}
