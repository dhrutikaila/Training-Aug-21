using Doctor_Api.Models;
using System.Collections.Generic;
using System.Linq;

namespace Doctor_Api.Controllers
{
    public interface IHospitalManagementRepository
    {
        List<Doctor> GetDoctors();
        Doctor GetDoctor(int Id);
        Doctor AddDoctor(Doctor doctor);
        bool DeleteDoctor(Doctor doctor);
        Doctor UpdateDoctor(Doctor doctor);
        PatientDoctor GetpatientAssignedToDoctor(Doctor doctor);
        MedicineList GetMedicineList(int Id);
        IQueryable<object> GetDoctorAndPatientReport();
    }
}