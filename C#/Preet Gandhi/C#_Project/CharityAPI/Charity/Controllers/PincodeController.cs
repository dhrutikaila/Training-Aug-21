using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PincodeController : BaseAdminController
    {
        private readonly IPincode _pincode;
        public PincodeController(IPincode pincode)
        {
            _pincode = pincode;
        }

        // POST: api/pincode
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<Pincode> AddPincode(Pincode pincode)
        {
            pincode.UpdatedBy = UserId;
            pincode.CreatedBy = UserId;
            pincode.CreatedAt = DateTime.Now;
            pincode.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
                return BadRequest("Invalid data.");
            bool created = _pincode.Create(pincode);
            if (created)
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });


            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }
        // GET: api/pincode
        [HttpGet]
        public ActionResult<IEnumerable<Pincode>> GetAll()
        {
            return Ok(_pincode.GetAll());
        }

        //get pincode by pincode id
        // GET: api/pincode/2
        [HttpGet("{id}")]
        public ActionResult<Pincode> GetPincodeById(int id)
        {
            var pinobj = _pincode.GetById(id);

            if (pinobj == null)
            {
                return NotFound();
            }

            return Ok(pinobj);
        }

        //get pincode by pincode
        // GET: api/pincode/382350
        [HttpGet("pincode/{pincode}")]
        public ActionResult<Pincode> GetPincodeByPincode(long pincode)
        {
            var pincode1 = _pincode.GetPincodeByPincode(pincode);

            if (pincode1 == null)
            {
                return NotFound();
            }

            return Ok(pincode1);
        }
        
        //get pincode by city id
        // GET: api/pincode/382350
        [HttpGet("city/{id}")]
        public ActionResult<Pincode> GetPincodeByCityId(long id)
        {
            var pincode1 = _pincode.GetPincodeByCityId(id);

            if (pincode1 == null)
            {
                return NotFound();
            }

            return Ok(pincode1);
        }

        //get pincode by postoffice name
        // GET: api/pincode/382350
        [HttpGet("postoffice/{pname}")]
        public ActionResult<States> GetPincodeByPostOfficeName(string pname)
        {
            var pincode1 = _pincode.GetPincodeByPostOfficeName(pname);

            if (pincode1 == null)
            {
                return NotFound();
            }

            return Ok(pincode1);
        }





        // PUT: api/pincode/1
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditPincode(int id, Pincode pincode)
        {
            pincode.UpdatedBy = UserId;
            pincode.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
                return BadRequest("Not a valid model");
            var pinobj = _pincode.GetById(id);
            if (pinobj == null)
            {
                return NotFound();

            }
            if (_pincode.Update(id, pincode))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });

        }

        // DELETE: api/pincode/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeletePincode(int id)
        {
            var pinobj = _pincode.GetById(id);
            if (pinobj != null)
            {
                bool deleted = _pincode.Delete(id);
                if (deleted)
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                return BadRequest();
            }
            return NotFound();
        }


    }
}
