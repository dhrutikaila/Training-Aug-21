using Day14.IServices;
using Day17.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day17.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class DoctorsController : ControllerBase
    {
        private readonly IDoctorServices _doctorServices;
        public DoctorsController(IDoctorServices doctorServices)
        {
            _doctorServices = doctorServices;
        }
        [HttpGet]
        public IActionResult GetAll()
        {
            try
            {
                var doctors = _doctorServices.GetDoctors();
                if (doctors != null)
                {
                    return Ok(doctors);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpGet("{doctorId}")]
        public IActionResult GetDoctorId(int doctorId)
        {
            try
            {
                var doctors = _doctorServices.Get(doctorId);
                if (doctors != null)
                {
                    return Ok(doctors);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost]
        public IActionResult AddDoctor(Doctor doctor)
        {
            try
            {
                return Ok(_doctorServices.AddDoctor(doctor));
                
            }
            catch (Exception)
            {
                throw;
            }
        }
        [Authorize(Roles = UserRoles.Admin)]
        [HttpPut("{doctorId}")]
        public IActionResult UpdateDoctor( Doctor doctor)
        {
            try
            {
                var result = _doctorServices.EditDoctor(doctor);
                if (result == true)
                {
                    return Ok();
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        [Authorize(Roles = UserRoles.Admin)]
        [HttpDelete("{id}")]
        public IActionResult DeleteDoctorData(int doctorId)
        {
            try
            {
                var result = _doctorServices.DeleteDoctor(doctorId);
                if (result == true)
                {
                    return Ok();
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
