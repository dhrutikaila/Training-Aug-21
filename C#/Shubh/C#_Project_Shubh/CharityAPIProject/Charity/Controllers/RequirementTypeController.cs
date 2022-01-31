using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using Microsoft.AspNetCore.Authorization;
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
    public class RequirementTypeController : BaseAdminController
    {
        private readonly IRequirementType _requirementTypes;
        public RequirementTypeController(IRequirementType requirementType)
        {
            _requirementTypes = requirementType;
        }

        // GET: api/requirementType
        [HttpGet]
        public ActionResult<IEnumerable<RequirementType>> GetRequirementTypes()
        {
            return Ok(_requirementTypes.GetAll());
        }

        // GET: api/requirementType/2
        [HttpGet("{id}")]
        public ActionResult<RequirementType> GetRequirementType(long id)
        {
            var requirementType = _requirementTypes.GetById(id);

            if (requirementType == null)
            {
                return NotFound();
            }

            return Ok(requirementType);
        }
        // PUT: api/requirementType/5
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditRequirementType(long id, RequirementType requirementType)
        {
            requirementType.UpdatedBy = UserId;
            requirementType.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
                return BadRequest("Not a valid model");
            var requirementTypeObject = _requirementTypes.GetById(id);
            if (requirementTypeObject == null)
            {
                return NotFound();
                
            }
            if (_requirementTypes.Update(id,requirementType))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });

        }
        // POST: api/requirementType
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<RequirementType> AddRequirementType(RequirementType requirementType)
        {
            requirementType.UpdatedBy = UserId;
            requirementType.CreatedBy = UserId;
            requirementType.CreatedAt = DateTime.Now;
            requirementType.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
                return BadRequest("Invalid data.");
            bool created = _requirementTypes.Create(requirementType);
            if(created)
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });
            

            return StatusCode(500, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: api/requirementType/id
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteRequirementType(long id)
        {
            var requirementTypeObject = _requirementTypes.GetById(id);
            if (requirementTypeObject != null)
            {
                bool deleted =_requirementTypes.Delete(id);
                if(deleted)
                    return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                return BadRequest();
            }
            return NotFound();
        }
    }
}
