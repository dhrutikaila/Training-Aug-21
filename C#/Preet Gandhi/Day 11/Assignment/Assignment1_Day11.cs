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
    public class Assignment1_Day11
    {
        static void Main(string[] args)
        {

            using (var context = new HospitalContext())
            {
                //1) Insert a Doctor
                var addDoctor = new Doctors()
                {
                    DrName = "Satish Vaghela",
                    DrAge = 45,
                    DrGender = "Male"
                };
                context.Doctors.Add(addDoctor);
                //context.Add<Doctors>(addDoctor);
                ////////////////////////////////////////////

                //2) Update a Doctor (Update record using 'First')
                var updateDoctor = context.Doctors.First<Doctors>();
                updateDoctor.DrAge = 48;
                //////////////////////////////////////////

                //3) Delete a Doctor(Delete record using Id)
                var deleteDoctor = new Doctors()
                {
                    DrId = 6
                };
                context.Remove(deleteDoctor);
                //context.Remove<Doctors>(deleteDoctor);

                context.SaveChanges();
                ////////////////////////////////////////////

                //4) Find a report of patient assigned to a particular doctor
                var patientReport = (from trt in context.Treatment
                                     join pt in context.Patients
                                     on trt.PtId equals pt.PtId
                                     join dept in context.Departments
                                     on trt.DeptId equals dept.DeptId
                                     join asst in context.HealthcareAssistances
                                     on trt.AsstId equals asst.AsstId
                                     join dr in context.Doctors
                                     on trt.DrId equals dr.DrId
                                     where trt.DrId == 1
                                     select new
                                     {
                                         Id = pt.PtId,
                                         Name = pt.PtName,
                                         Age = pt.PtAge,
                                         Gender = pt.PtGender,
                                         Disease = pt.PtDisease,
                                         DoctorName = dr.DrName,
                                         DepName = dept.DeptName,
                                         AssistantName = asst.AsstName
                                     }).ToList();
                foreach (var answer in patientReport)
                {
                    Console.WriteLine($"PatientId: {answer.Id} \nPatientName: {answer.Name} \nPatientAge: {answer.Age} \nPatientGender: {answer.Gender} \nPatientDisease: {answer.Disease} \nDoctorName: {answer.DoctorName} \nDepartmentName: {answer.DepName} \nAssistanceName: {answer.AssistantName}");
                }
                ////////////////////////////////////////////

                //5) Find a report of medicine list for a particular patient
                var medicineReport = (from med in context.MedicalPrescription
                                      join pt in context.Patients
                                      on med.PtId equals pt.PtId
                                      join drug in context.Drugs
                                      on med.DrugId equals drug.DrugId
                                      join dp in context.DayParts
                                      on med.DayPartId equals dp.DayPartId
                                      where med.PtId == 2
                                      select new
                                      {
                                          Id = pt.PtId,
                                          Name = pt.PtName,
                                          DrugName = drug.DrugName,
                                          DayPart = dp.DayPartName
                                      }).ToList();
                foreach (var answer2 in medicineReport)
                {
                    Console.WriteLine($"PatientId: {answer2.Id} \nPatientName: {answer2.Name} \nDrugName: {answer2.DrugName} \nDayPart: {answer2.DayPart}");
                }
                ////////////////////////////////////////////

                //6) Display summary report of Doctor and patient(use Include method)
                //Doctor Report
                var doctors = context.Doctors
                                .Include(t => t.Treatment)
                                .ToList();
                foreach (var doc in doctors)
                {
                    Console.WriteLine($"DoctorName: {doc.DrName} \nDoctorAge: {doc.DrAge} \nDoctorGender: {doc.DrGender}");
                    foreach (var trt in doc.Treatment)
                    {
                        Console.WriteLine($"PatientId: {trt.PtId}");
                        Console.WriteLine("------------------------");
                    }
                }

                //Patient Report
                var patients = context.Patients
                                .Include(t => t.Treatment)
                                .ToList();
                foreach (var pt in patients)
                {
                    Console.WriteLine($"PatientName: {pt.PtName} \nPatientAge: {pt.PtAge} \nPatientGender: {pt.PtGender} \nPatientDisease: {pt.PtDisease}");
                    foreach (var trt in pt.Treatment)
                    {
                        Console.WriteLine($"DocId: {trt.DrId}");
                        Console.WriteLine("------------------------");
                    }
                }
            }
        }
    }
}
