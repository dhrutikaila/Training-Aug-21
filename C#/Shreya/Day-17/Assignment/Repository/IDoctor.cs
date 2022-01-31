using Day_17Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day_17Assignment.Repository
{
    public interface IDoctor
    {
        List<Doctor> GetDoctors();
        Doctor GetDoctor(int id);
        Doctor AddDoctor(Doctor doctor);

        //Delete Doctor
        void DeleteDoctor(Doctor doctor);

        //update Doctor
        Doctor EditDoctor(Doctor doctor);
    }
}
