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
  
    [ApiController]
    public class empsController : ControllerBase
    {
        private readonly IEmployee _employee;
        public empsController(IEmployee employee)
        {
            _employee = employee;
        }
        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetEmployees()
        {
            return Ok(_employee.GetEmployees());
        }
        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetEmployee(int id)
        {
            var employee = _employee.GetEmployee(id);
            if (employee != null)
            {
                return Ok(employee);
            }
            return NotFound($"Employee with this id {id} was not found");
        }
        [HttpPost]
        [Route("api/[controller]")]
        public IActionResult GetEmployee(Employee employee)
        {
            _employee.AddEmployee(employee);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + employee.EmployeeId
                , employee);
        }
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        public IActionResult DeleteEmployee(int id)
        {
            var employee = _employee.GetEmployee(id);
            if (employee != null)
            {
                _employee.DeleteEmployee(employee);
                return Ok();
            }
            return NotFound($"Employee with this id {id} was not found");
        }

        [HttpPatch]
        [Route("api/[controller]/{id}")]
        public IActionResult EditEmployee(int id, Employee employee)
        {
            var ExistingEmployee = _employee.GetEmployee(id);
            if (ExistingEmployee != null)
            {
                employee.EmployeeId = ExistingEmployee.EmployeeId;
                _employee.UpdateEmployee(employee);
                return Ok();
            }
            return Ok(employee);
        }

    }
}
