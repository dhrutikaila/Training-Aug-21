using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_15.EmployeeData;
using Day_15.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Day_15.Controllers
{
   
    [ApiController]
    public class EmployeesController : ControllerBase
    {
        private readonly IEmployeeData _employeeData;
        public EmployeesController(IEmployeeData employeeData)
        {
            _employeeData = employeeData;
        }

        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetEmployees()
        {
            return Ok(_employeeData.GetEmployees());
        }

        [HttpGet]
        [Route("api/[controller]/{employeeid}")]
        public IActionResult GetEmployee(int employeeid)
        {
            var employee = _employeeData.GetEmployee(employeeid);

            if (employee != null)
            {
                return Ok(employee);
            }
            return NotFound($"Employee with id: {employeeid} was not found.");
        }

        [HttpPost]
        [Route("api/[controller]")]
        public IActionResult AddEmployee(Employee employee)
        {
            _employeeData.AddEmployee(employee);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + employee.EmployeeId, employee);
        }

        [HttpDelete]
        [Route("api/[controller]/{employeeid}")]
        public IActionResult DeleteEmployee(int employeeid)
        {
            var employee = _employeeData.GetEmployee(employeeid);

            if (employee != null)
            {
                _employeeData.DeleteEmployee(employee);
                return Ok();
            }

            return NotFound($"Employee with id: {employeeid} was not found.");
        }

        [HttpPatch]
        [Route("api/[controller]/{employeeid}")]
        public IActionResult EditEmployee(int employeeid, Employee employee)
        {
            var existingEmployee = _employeeData.GetEmployee(employeeid);

            if (existingEmployee != null)
            {
                employee.EmployeeId = existingEmployee.EmployeeId;
                _employeeData.EditEmployee(employee);
            }

            return Ok(employee);
        }
    }
}
