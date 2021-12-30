using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HospitalAuthenticationTask.Models;

namespace HospitalAuthenticationTask.Repository
{
    public interface IHospitalRepository
    {

        IEnumerable<Doctors> GetDoctors();
        void AddDoctor(Doctors doctor);
        bool Save();
        Doctors GetDoctor(int doctorId);
        void DeleteDoctor(Doctors doctorToDelete);
    }
}
