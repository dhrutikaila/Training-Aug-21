using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day17.IServices
{
    public interface IReportServices
    {
        public IEnumerable GetPatientsByDoctor(int doctorId);
        public IEnumerable GetPatient(int patientId);
        public IEnumerable GetAllPatients();
    }
}
