using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MCDELIVERY_1.Models;
using MCDELIVERY_1.interfaces;

namespace MCDELIVERY_1.Controllers
{
    [Authorize(Roles = UserRoles.Admin)]
    [Route("api/[controller]")]
    [ApiController]
    public class UserTablesController : ControllerBase
    {
        private IUserTable _context;

        public UserTablesController(IUserTable context)
        {
            _context = context;
        }

        // GET: api/UserTables
        [HttpGet]
        public IActionResult GetUserTables()
        {
            return Ok(_context.GetUserTables());
        }

        // GET: api/UserTables/5
        [HttpGet("{id}")]
        public IActionResult GetUserTable(int id)
        {

            var user = _context.GetUserTable(id);

            if (user != null)
            {
                return Ok(user);
            }

            return NotFound("user is not found");
        }

        // PUT: api/UserTables/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public IActionResult PutUserTable(int id, UserTable userTable)
        {

            var Edituser = _context.GetUserTable(id);
            if (Edituser != null)
            {
                userTable.UsersId= Edituser.UsersId;
                _context.PutUserTable(userTable);
            }
            return Ok(userTable);
        }

        // POST: api/UserTables
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public IActionResult PostUserTable(UserTable userTable)
        {
            _context.PostUserTable(userTable);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host +
                HttpContext.Request.Path + "/" + userTable.UsersId,userTable);
        }

        // DELETE: api/UserTables/5
        [HttpDelete("{id}")]
        public IActionResult DeleteUserTable(int id)
        {
            var user = _context.GetUserTable(id);
            if (user != null)
            {
                _context.DeleteUserTable(user);
                return Ok();
            }
            return NotFound($"user with id: {id} is not found");
        }

        //private bool UserTableExists(int id)
        //{
        //    return _context.UserTables.Any(e => e.UsersId == id);
        //}
    }
}
