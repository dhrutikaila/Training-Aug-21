
using Day15.IServices;
using Day15.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day15.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class EmpController : ControllerBase
    {
        private readonly IEmployeeServices _employeeServices;
        private readonly IAssignmentServices _assignmentServices;
        public EmpController(IEmployeeServices employeeServices, IAssignmentServices assignmentServices)
       // public EmpController(IEmployeeServices employeeServices)
        {
            _employeeServices = employeeServices;
            _assignmentServices = assignmentServices;
        }
        [HttpGet]
        public IActionResult GetAll()
        {
            try
            {
                var emps = _employeeServices.GetEmployees();
                if (emps != null)
                {
                    return Ok(emps);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpGet("{employeeId}")]
        public IActionResult GetDoctorId(int employeeId)
        {
            try
            {
                var emps = _employeeServices.Get(employeeId);
                if (emps != null)
                {
                    return Ok(emps);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IActionResult AddEmployee(Employee employee)
        {
            try
            {
                return Ok(_employeeServices.AddEmployee(employee));

            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPut]
        public IActionResult UpdateEmployee(Employee employee)
        {
            try
            {
                var result = _employeeServices.EditEmployee(employee);
                if (result == true)
                {
                    return Ok();
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteEmployeeData(int employeeId)
        {
            try
            {
                var result = _employeeServices.DeleteEmployee(employeeId);
                if (result == true)
                {
                    return Ok();
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        //assignments
        [Route("{employeeId}/child/assignment")]
        [HttpGet]
        public IActionResult GetAssignments(int employeeId)
        {
            try
            {
                var result = _assignmentServices.GetAssignments(employeeId);
                if (result.Any())
                {
                    return Ok(result);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        [Route("{employeeId}/child/assignment/{assignmentId}")]
        [HttpGet]
        public IActionResult GetAssignment(int employeeId, int assignmentId)
        {
            try
            {
                var result = _assignmentServices.Get(assignmentId, employeeId);
                if (result != null)
                {
                    return Ok(result);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        [Route("{employeeId}/child/assignment")]
        [HttpPost]
        public IActionResult AddAssignment(Assignment assignment)
        {
            try
            {
                return Ok(_assignmentServices.AddAssignment(assignment));

            }
            catch (Exception)
            {
                throw;
            }

        }


        [Route("{employeeId}/child/assignment/{assignmentId}")]
        [HttpPut]
        public IActionResult EditAssignment(Assignment assignment)
        {
            try
            {
                var result = _assignmentServices.EditAssignment(assignment);
                if (result)
                {
                    return Ok(assignment);
                }
                else
                {
                    return NotFound(assignment.AssignmentId);
                }
            }
            catch (Exception)
            {
                throw;
            }

        }

        [Route("{employeeId}/child/assignment/{assignmentId}")]
        [HttpDelete]
        public IActionResult DeleteAssignment(int assignmentId)
        {
            try
            {
                var result = _assignmentServices.DeleteAssignment(assignmentId);
                if (result)
                {
                    return Ok();
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
