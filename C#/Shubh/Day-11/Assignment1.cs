//Create A Database design and insert record in the database. Create views

// In a hospital there are different departments. Patients are treated in these departments by the doctors assigned to patients. Usually each patient is treated by a single doctor, but in rare cases they will have two or three. Healthcare assistants will also attend to patients; every department has many healthcare assistants. Each patient is required to take a variety of drugs during different parts of the day such as morning, afternoon and night.

//After Creating a Database design. Create ORM with database first Approach.

//Insert a Doctor

//Update a Doctor

//Delete a Doctor

//Find a report of patient assigned to a particular doctor

//Find a report of medicine list for a particular patient

//Display summary report of Doctor and patient (use Include method)

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Day_11.Assignment_Day11;

namespace Day_11
{
    public class Assignment11_1
    {
        static void Main(string[] args)
        {

            using (var context = new HospitalContext())
            {
                //Insert
                var addDoctor = new Doctor()
                {
                    DrId = 7,
                    Name = "Kishansingh",
                    Department = 1
                };
                context.Doctor.Add(addDoctor);
                

                //Update
                var updateDoctor = context.Doctor.First<Doctor>();
                updateDoctor.Department = 6;

                //Delete
                var deleteDoctor = new Doctor()
                {
                    DrId = 5
                };
                context.Remove(deleteDoctor);

                context.SaveChanges();

                //Report of patient-doctor
                var patientReport = (from C in context.Cure
                                     join P in context.Patients
                                     on C.PatId equals P.PatId
                                     join De in context.Department
                                     on C.DeptId equals De.DeptId
                                     join H in context.Healthcare
                                     on C.HcWId equals H.HcWId
                                     join D in context.Doctors
                                     on C.DrId equals D.DrId
                                     where C.DrId == 1
                                     select new
                                     {
                                         Id = P.PatId,
                                         Name = P.PtName,
                                         Department = De.DepartmentName,
                                         DoctorName = D.Name,
                                         HealthcareWorkerName = H.Name
                                     }).ToList();
                foreach (var answer in patientReport)
                {
                    Console.WriteLine($"PatientId: {answer.Id} \nPatientName: {answer.Name} \nPatientAge: {answer.Age} \nPatientGender: {answer.Gender} \nPatientDisease: {answer.Disease} \nDoctorName: {answer.DoctorName} \nDepartmentName: {answer.DepName} \nAssistanceName: {answer.AssistantName}");
                }

                //Report of medicine
                var medicineReport = (from M in context.Medicine
                                      join P in context.Patients
                                      on M.PatId equals P.PatId                                      
                                      where P.PatId == 2
                                      select new
                                      {
                                          Id = P.PatId,
                                          Name = P.Name,
                                          Medicine = M.Name,
                                          Time = P.TimePeriod
                                      }).ToList();
                foreach (var answer2 in medicineReport)
                {
                    Console.WriteLine($"PatientId: {answer2.Id} \nPatientName: {answer2.Name} \nDrugName: {answer2.DrugName} \nDayPart: {answer2.DayPart}");
                }

                //Report of Doctor-patient(Include method)
                var doctors = context.Doctor
                                .Include(C => C.Cure)
                                .ToList();
                foreach (var dc in doctor)
                {
                    Console.WriteLine($"DoctorId: {dc.DrId} \nDoctorName: {dc.DrName}");
                    foreach (var C in dc.Cure)
                    {
                        Console.WriteLine($"PatientId: {C.PatId}");
                        Console.WriteLine("------------------------");
                    }
                }

                //Patient Report
                var patients = context.Patients
                                .Include(C => C.Cure)
                                .ToList();
                foreach (var P in Patients)
                {
                    Console.WriteLine($"PatientName: {P.Name} \nPatientAge: {P.PtAge} \nPatientGender: {pt.PtGender} \nPatientDisease: {P.PtDisease}");
                    foreach (var C in P.Cure)
                    {
                        Console.WriteLine($"DocId: {C.DrId}");
                        Console.WriteLine("------------------------");
                    }
                }
            }
        }
    }
}
