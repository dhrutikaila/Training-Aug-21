using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_17_Assignment.Models;

namespace Day_17_Assignment.DoctorData
{
    public class SqlDoctorData : IDoctorData
    {
        private readonly HospitalContext _hospitalContext;
        public SqlDoctorData(HospitalContext hospitalContext)
        {
            _hospitalContext = hospitalContext;
        }
        public Doctors AddDoctor(Doctors doctor)
        {
            _hospitalContext.Doctors.Add(doctor);
            _hospitalContext.SaveChanges();
            return doctor;
        }

        public void DeleteDoctor(Doctors doctor)
        {
            _hospitalContext.Doctors.Remove(doctor);
            _hospitalContext.SaveChanges();
        }

        public Doctors EditDoctor(Doctors doctor)
        {
            var existingDoctor = _hospitalContext.Doctors.Find(doctor.DrId);

            if (existingDoctor != null)
            {
                existingDoctor.DrName = doctor.DrName;
                existingDoctor.DrAge = doctor.DrAge;
                existingDoctor.DrGender = doctor.DrGender;


                _hospitalContext.Doctors.Update(existingDoctor);
                _hospitalContext.SaveChanges();
            }
            return doctor;
        }

        public Doctors GetDoctor(int id)
        {
            var order = _hospitalContext.Doctors.Find(id);
            return order;
        }

        public List<Doctors> GetDoctors()
        {
            return _hospitalContext.Doctors.ToList();
        }
    }
}
