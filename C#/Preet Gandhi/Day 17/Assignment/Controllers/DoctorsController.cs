using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_17_Assignment.DoctorData;
using Day_17_Assignment.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Day_17_Assignment.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class DoctorsController : ControllerBase
    {
        private readonly IDoctorData _doctorData;
        public DoctorsController(IDoctorData doctorData)
        {
            _doctorData = doctorData;
        }

        [HttpGet]
        public IActionResult GetDoctors()
        {
            return Ok(_doctorData.GetDoctors());
        }

        [HttpGet]
        [Route("{id}")]
        public IActionResult GetDoctor(int id)
        {
            var doctor = _doctorData.GetDoctor(id);

            if (doctor != null)
            {
                return Ok(doctor);
            }
            return NotFound($"Doctor with id: {id} was not found.");
        }

        
        [HttpPost]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult AddDoctor(Doctors doctor)
        {
            _doctorData.AddDoctor(doctor);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + doctor.DrId, doctor);
        }

        
        [HttpDelete]
        [Route("{id}")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult DeleteDoctor(int id)
        {
            var doctor = _doctorData.GetDoctor(id);

            if (doctor != null)
            {
                _doctorData.DeleteDoctor(doctor);
                return Ok();
            }

            return NotFound($"Doctor with id: {id} was not found.");
        }

        
        [HttpPatch]
        [Route("{id}")]
        [Authorize(Roles = UserRoles.Admin)]
        public IActionResult EditDoctor(int id, Doctors doctor)
        {
            var existingDoctor = _doctorData.GetDoctor(id);

            if (existingDoctor != null)
            {
                doctor.DrId = existingDoctor.DrId;
                _doctorData.EditDoctor(doctor);
            }

            return Ok(doctor);
        }
    }
}
