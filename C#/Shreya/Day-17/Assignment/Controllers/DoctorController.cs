using Day_17Assignment.Models;
using Day_17Assignment.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_17Assignment.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    public class DoctorController : ControllerBase
    {
        private IDoctor _doctor;
        public DoctorController(IDoctor doctor)
        {
             _doctor = doctor;
        }
        [HttpGet]
        public IActionResult GetDoctor()
        {
            return Ok(_doctor.GetDoctors());
        }
        [HttpPost]
        public IActionResult GetDoctor(Doctor doctor)
        {
            _doctor.AddDoctor(doctor);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + doctor.DoctorId
               , doctor);
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteDoctor(int id)
        {
            var doctor = _doctor.GetDoctor(id);
            if(doctor != null)
            {
                _doctor.DeleteDoctor(doctor);
                return Ok();
            }
            return NotFound($"Doctor with this id {id} was not found");
        }
        [HttpPatch("{id}")]
        public IActionResult EditEmployee(int id, Doctor doctor)
        {
            var ExistingDoctor = _doctor.GetDoctor(id);
            if (ExistingDoctor != null)
            {
                doctor.DoctorId = ExistingDoctor.DoctorId;
                _doctor.EditDoctor(doctor);
                return Ok();
            }
            return Ok(doctor);
        }
    }
}
