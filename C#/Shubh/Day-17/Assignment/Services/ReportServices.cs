using Day17.IServices;
using Day17.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day17.Services
{
    public class ReportServices : IReportServices
    {
        private readonly HealthCareJWTContext _context;
        public ReportServices(HealthCareJWTContext context)
        {
            _context = context;
        }

        public IEnumerable GetAllPatients()
        {
            return _context.Treatment.Include(x => x.Patient).Include(x => x.Doctor).ToList();
        }

        public IEnumerable GetPatient(int patientId)
        {
            return _context.Prescribed.Include(x => x.Treatment).Where(x => x.Treatment.PatientId == patientId);
        }

        public IEnumerable GetPatientsByDoctor(int doctorId)
        {
            return _context.Treatment.Include(x => x.Patient).Include(x => x.Doctor).Where(x => x.DoctorId == doctorId);
        }
    }
}
