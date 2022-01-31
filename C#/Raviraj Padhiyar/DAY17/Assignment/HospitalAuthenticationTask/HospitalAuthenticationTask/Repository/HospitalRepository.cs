using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalAuthenticationTask.Models;

namespace HospitalAuthenticationTask.Repository
{
    public class HospitalRepository : IHospitalRepository
    {
        private readonly HospitalTaskDBContext _context;

        public HospitalRepository(HospitalTaskDBContext context)
        {
            _context = context ??
                throw new ArgumentNullException(nameof(context));
        }

        public void AddDoctor(Doctors doctor)
        {
            if (doctor == null)
            {
                throw new ArgumentNullException(nameof(doctor));
            }

            _context.Doctors.Add(doctor);

        }

        public void DeleteDoctor(Doctors doctorToDelete)
        {
            _context.Doctors.Remove(doctorToDelete);
        }

        public Doctors GetDoctor(int doctorId)
        {
            if(doctorId <= 0)
            {
                throw new ArgumentNullException(nameof(doctorId));
            }

            return _context.Doctors
                .FirstOrDefault(a => a.Id == doctorId);
        }

        public IEnumerable<Doctors> GetDoctors()
        {
            return _context.Doctors.ToList<Doctors>();
        }



        public bool Save()
        {
            return (_context.SaveChanges() >= 0);
        }
    }
}
