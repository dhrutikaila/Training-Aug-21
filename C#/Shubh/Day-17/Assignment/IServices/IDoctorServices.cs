using Day17.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day14.IServices
{
    public interface IDoctorServices
    {
        IEnumerable<Doctor> GetDoctors();
        Doctor Get(int doctorId);
        Doctor AddDoctor(Doctor doctor);
        bool EditDoctor(Doctor doctor);
        bool DeleteDoctor(int doctorId);
    }
}
