using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MCDELIVERY_1.Models;
using MCDELIVERY_1.interfaces;
using Microsoft.AspNetCore.Authorization;

namespace MCDELIVERY_1.Controllers
{
    [Authorize(Roles = UserRoles.Admin)]
    [Route("api/[controller]")]
    [ApiController]
    public class AdminsController : ControllerBase
    {
        private IAdmin _context;

        public AdminsController(IAdmin context)
        {
            _context = context;
        }

        // GET: api/Admins
        [HttpGet]
        public IActionResult GetAdmins()
        {
            return Ok(_context.GetAdmins());
        }

        // GET: api/Admins/5
        [HttpGet("{id}")]
        public  IActionResult GetAdmin(int id)
        {
            var admin = _context.GetAdmin(id);

            if (admin != null)
            {
                return Ok(admin);
            }

            return NotFound("admin not found");
        }

        // PUT: api/Admins/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public  IActionResult PutAdmin(int id, Admin admin)
        {
            var Editadmin = _context.GetAdmin(id);
            if (Editadmin != null)
            {
                admin.Id = Editadmin.Id;
                _context.PutAdmin(admin);
            }
            return Ok(admin);
        }

        // POST: api/Admins
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public IActionResult PostAdmin(Admin admin)
        {
            _context.PostAdmin(admin);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + 
                HttpContext.Request.Path+"/"+admin.Id,admin);
        }

        // DELETE: api/Admins/5
        [HttpDelete("{id}")]
        public IActionResult DeleteAdmin(int id)
        {
            var admin = _context.GetAdmin(id);
            if (admin != null)
            {
                _context.DeleteAdmin(admin);
                return Ok();
            }
            return NotFound($"Admin with id: {id} is not found");
        }

        //private bool AdminExists(int id)
        //{
        //    return _context.Admins.Any(e => e.Id == id);
        //}
    }
}
