using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Day15_2.Models;

namespace Day15_2.Controllers
{

    
/*
 * reate an Assignments API

http://localhost:3000/emps/{empID}/child/assignments

Get All Assignments

http://localhost:3000/emps/{empID}/child/assignments

Get an Assignment

http://localhost:3000/emps/{empID}/child/assignments/{AssignmentID}

Update an assignment

http://localhost:3000/emps/{empID}/child/assignments/{AssignmentID}
 
 
 */
    [Route("emps")]
    [ApiController]
    public class employeesController : ControllerBase
    {
        private readonly MainDBContext _context;

        public employeesController(MainDBContext context)
        {
            _context = context;
        }

        // GET: api/employees
        [HttpGet]
        public async Task<ActionResult<IEnumerable<employee>>> Getemployees()
        {
            return await _context.employees.ToListAsync();
        }

        // GET: api/employees/5
        [HttpGet("{id}")]
        public async Task<ActionResult<employee>> Getemployee(int id)
        {
            var employee = await _context.employees.FindAsync(id);

            if (employee == null)
            {
                return NotFound();
            }

            return employee;
        }

        // PUT: api/employees/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Putemployee(int id, employee employee)
        {
            if (id != employee.employee_id)
            {
                return BadRequest();
            }

            _context.Entry(employee).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!employeeExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/employees
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<employee>> Postemployee(employee employee)
        {
            _context.employees.Add(employee);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Getemployee", new { id = employee.employee_id }, employee);
        }

        // DELETE: api/employees/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Deleteemployee(int id)
        {
            var employee = await _context.employees.FindAsync(id);
            if (employee == null)
            {
                return NotFound();
            }

            _context.employees.Remove(employee);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool employeeExists(int id)
        {
            return _context.employees.Any(e => e.employee_id == id);
        }
    }
}








/*
 * reate an Assignments API

http://localhost:3000/emps/{empID}/child/assignments

Get All Assignments

http://localhost:3000/emps/{empID}/child/assignments

Get an Assignment

http://localhost:3000/emps/{empID}/child/assignments/{AssignmentID}

Update an assignment

http://localhost:3000/emps/{empID}/child/assignments/{AssignmentID}
 
 
 */