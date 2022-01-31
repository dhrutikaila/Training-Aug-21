using Day17.IServices;
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
    public class ReportController : ControllerBase
    {
        private readonly IReportServices _reportServices;
        public ReportController(IReportServices reportServices)
        {
            _reportServices = reportServices;
        }
        [HttpGet]
        public IActionResult GetAllPatients()
        {
            try
            {
                var result = _reportServices.GetAllPatients();
                if (result != null)
                {
                    return Ok(result);
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
        public IActionResult GetPatientsInfoForDoctor(int doctorId)
        {
            try
            {
                var result = _reportServices.GetPatientsByDoctor(doctorId);
                if (result != null)
                {
                    return Ok(result);
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

        [HttpGet("medicalData/{patientId}")]
        public IActionResult GetPatient(int patientId)
        {
            try
            {
                var result = _reportServices.GetPatient(patientId);
                if (result != null)
                {
                    return Ok(result);
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
