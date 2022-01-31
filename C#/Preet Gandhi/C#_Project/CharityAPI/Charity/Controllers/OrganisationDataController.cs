using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using CharityAPI.Authentication;
using CharityAPI.IServices;
using CharityAPI.Models;
using CharityAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace CharityAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrganisationDataController : BaseAdminController
    {
        private readonly IOrganisationData _organisationData;

        public OrganisationDataController(IOrganisationData organisationData)
        {
            _organisationData = organisationData;
        }

        //GET: api/organisationData
        [HttpGet]
        public ActionResult<IEnumerable<OrganisationData>> GetOrganisationDatas()
        {
            return Ok(_organisationData.GetAll());
        }

        //GET: api/organisationData/1
        [HttpGet("{id}")]
        public ActionResult<OrganisationData> GetOrganisationData(long id)
        {
            var organisationData = _organisationData.GetById(id);

            if (organisationData == null)
            {
                return NotFound();
            }

            return Ok(organisationData);
        }

        // PUT: api/organisationData/1
        [HttpPut("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditOrganisationData(long id)
        {
            var orgData = new OrganisationData();
            var httpRequest = HttpContext.Request;
            orgData = JsonConvert.DeserializeObject<OrganisationData>(httpRequest.Form["orgData"]);
            Image img = null;

            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                orgData.OrganisationLogoUrl = HttpContext.Request.Form.Files[0].FileName;

            }
            orgData.UpdatedBy = UserId;
            orgData.UpdatedAt = DateTime.Now;
            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid Model");
            }
            var organisationDataObject = _organisationData.GetById(id);

            if (organisationDataObject == null)
            {
                return NotFound();
            }
            if (_organisationData.Update(id, orgData, img))
            {
                return StatusCode(StatusCodes.Status200OK, new Response { Status = "Updated", Message = "Data updated successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // POST: api/organisationData
        [HttpPost]
        //[Authorize(Roles = UserRoles.Admin)]
        public ActionResult<OrganisationData> AddOrganisationData()
        {
            var orgData = new OrganisationData();
            var httpRequest = HttpContext.Request;
            orgData = JsonConvert.DeserializeObject<OrganisationData>(httpRequest.Form["orgData"]);
            Image img = null;
            string fileName = "";

            if (httpRequest.Form.Files.Count > 0)
            {
                img = Image.FromStream(HttpContext.Request.Form.Files[0].OpenReadStream());
                fileName = HttpContext.Request.Form.Files[0].FileName;
                orgData.OrganisationLogoUrl = fileName;

            }
            orgData.CreatedBy = UserId;
            orgData.CreatedAt = DateTime.Now;
            orgData.UpdatedBy = UserId;
            orgData.UpdatedAt = DateTime.Now;

            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data.");
            }
            bool created = _organisationData.Create(orgData,img,fileName);
            if (created)
            {
                return StatusCode(StatusCodes.Status201Created, new Response { Status = "Created", Message = "Data Added successfully!" });
            }
            return StatusCode(StatusCodes.Status500InternalServerError, new Response { Status = "Error", Message = "Something went wrong. Please contact Administrator!" });
        }

        // DELETE: api/organisationData/1
        [HttpDelete("{id}")]
        //[Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteOrganisationData(long id)
        {
            var organisationDataObject = _organisationData.GetById(id);
            if (organisationDataObject != null)
            {
                bool deleted = _organisationData.Delete(id);
                if (deleted)
                {
                    if (organisationDataObject.OrganisationLogoUrl != null && !string.IsNullOrEmpty(organisationDataObject.OrganisationLogoUrl))
                    {
                        var commonHelper = new CommonHelper();
                        var attaachmentPath = commonHelper.GetOrganisationPath(id);
                        commonHelper.DeleteAllfile(attaachmentPath);
                        return StatusCode(StatusCodes.Status202Accepted, new Response { Status = "Deleted", Message = "Data deleted successfully!" });
                    }
                }
                return BadRequest();
            }
            return NotFound();
        }

        //GET: api/organisationData/name/RHA
        [HttpGet("name/{name}")]
        public ActionResult<ClusterLocations> GetOrganisationDataByOrganisationName(string name)
        {
            var organisationData = _organisationData.GetByOrganisationName(name);

            if (organisationData == null)
            {
                return NotFound();
            }

            return Ok(organisationData);
        }

        //GET: api/organisationData/userid/1
        [HttpGet("userid/{id}")]
        public ActionResult<ClusterLocations> GetOrganisationDataByUserId(long id)
        {
            var organisationData = _organisationData.GetByUserId(id);

            if (organisationData == null)
            {
                return NotFound();
            }

            return Ok(organisationData);
        }
    }
}
