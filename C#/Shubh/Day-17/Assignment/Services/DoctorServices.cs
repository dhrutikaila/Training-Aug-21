using Day14.IServices;
using Day17.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day17.Services
{
    public class DoctorServices : IDoctorServices
    {
        private readonly HealthCareJWTContext _context;
        public DoctorServices(HealthCareJWTContext context)
        {
            _context = context;
        }

        public Doctor AddDoctor(Doctor doctor)
        {
            var result = _context.Doctor.Add(doctor);
            _context.SaveChanges();
            return result.Entity;
        }

        public bool DeleteDoctor(int doctorId)
        {
            var customer = _context.Doctor.Find(doctorId);
            if (customer != null)
            {
                customer.IsActive = false;
                _context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool EditDoctor(Doctor doctor)
        {
            var dCustomer = _context.Doctor.Find(doctor.DoctorId);
            if (dCustomer != null)
            {
                _context.Entry(doctor).State = EntityState.Modified;
                _context.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public Doctor Get(int doctorId)
        {
            var doctor = _context.Doctor.Find(doctorId);
            return doctor;
        }

        public IEnumerable<Doctor> GetDoctors()
        {
            return _context.Doctor.ToList();
        }
    }
}
