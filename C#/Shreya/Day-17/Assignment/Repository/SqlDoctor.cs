using Day_17Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_17Assignment.Repository
{
    public class SqlDoctor : IDoctor
    {
        private HealthCareDbContext _healthCareDbContext;
        public SqlDoctor(HealthCareDbContext healthCareDbContext)
        {
            _healthCareDbContext = healthCareDbContext;
        }
        public Doctor AddDoctor(Doctor doctor)
        {
            _healthCareDbContext.Doctors.Add(doctor);
            _healthCareDbContext.SaveChanges();
            return doctor;
        }

        public void DeleteDoctor(Doctor doctor)
        {
            _healthCareDbContext.Remove(doctor);
            _healthCareDbContext.SaveChanges();
        }

        public Doctor EditDoctor(Doctor doctor)
        {
            var ExistingDoctor = _healthCareDbContext.Doctors.Find(doctor.DoctorId);
            if (ExistingDoctor != null)
            {
                ExistingDoctor.DoctorName = doctor.DoctorName;
                _healthCareDbContext.Doctors.Update(doctor);
                _healthCareDbContext.SaveChanges();
            }
            return doctor;
        }

        public Doctor GetDoctor(int id )
        {
            var doctor = _healthCareDbContext.Doctors.Find(id);
            return doctor;
        }

        public List<Doctor> GetDoctors()
        {
            return _healthCareDbContext.Doctors.ToList();
        }
    }
}
