using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_17_Assignment.Models;

namespace Day_17_Assignment.DoctorData
{
    public interface IDoctorData
    {
        List<Doctors> GetDoctors();

        Doctors GetDoctor(int id);

        Doctors AddDoctor(Doctors doctor);

        void DeleteDoctor(Doctors doctor);

        Doctors EditDoctor(Doctors doctor);
    }
}
