using Day_10.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
namespace Day_10
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new HospitalDbContext())
            {
                //Add doctor 
                void insert()
                {
                    Doctor dc = new Doctor();
                    dc.doctors();
                    List<Doctor> doctors = new List<Doctor>()
                    {
                    new Doctor(){DoctorName = dc.name,DepartmentId = dc.dept_id}
                    };
                    context.Doctors.AddRange(doctors);
                    context.SaveChanges();
                    Console.WriteLine("Doctor Added successfully!!");
                }
                //update doctor 
                void update()
                {
                    Console.WriteLine("Enter the doctor name which you want to update");
                    string docname = Console.ReadLine();
                    var doc = context.Doctors.Where(p => p.DoctorName == docname).FirstOrDefault();
                    if (doc is Doctor)
                    {
                        Console.WriteLine("Updated name is :");
                        string updatedName = Console.ReadLine();
                        doc.DoctorName = updatedName;
                    }
                    context.SaveChanges();
                    Console.WriteLine("Doctor updated successfully!!");
                }
                //Delete doctor 
                void delete()
                {
                    Console.WriteLine("Enter the name which you want to delete");
                    string name = Console.ReadLine();
                    var doc2 = context.Doctors.Where(p => p.DoctorName == name).FirstOrDefault();
                    if (doc2 is Doctor)
                    {
                        context.Remove(doc2);
                    }
                    context.SaveChanges();
                    Console.WriteLine("Doctor Deleted successfully!!");
                }
               
                void PatientReport()
                {
                    Console.WriteLine("Enter Patient Id :");
                    int patientId = Convert.ToInt32(Console.ReadLine());
                    var patient = context.TreatMents.Include(p => p.Patient)
                                                    .Include(d => d.Doctor)
                                                    .ThenInclude(dept=>dept.Department)
                                                    .Where(p => p.PatientId == patientId).ToList();
                    foreach(var Patient1 in patient)
                    {
                        Console.WriteLine("Patients Id is {0},Patient name is {1}",Patient1.PatientId,Patient1.Patient.PatientName);
                        Console.WriteLine("Doctor name is {0},Department is {1}",Patient1.Doctor.DoctorName,Patient1.Doctor.Department.DepartmentName);
                        //foreach (var doc in Patient1.Doctor.DoctorName)
                        //{
                        //    Console.WriteLine("Doctor name is {0}",doc.ToString());
                        //}
                    }     
                }
                void MedicineReport()
                {
                    Console.WriteLine("Enter Patient Id :");
                    int patientId = Convert.ToInt32(Console.ReadLine());
                    var medicineSchedule = context.DrugsSchedules.Include(d => d.Drug)
                                                        .Include(p=>p.Patient)
                                                        .ThenInclude(d=>d.Department)
                                                    .Where(p => p.PatientId == patientId).ToList();
                    foreach(var medicine in medicineSchedule)
                    {
                        Console.WriteLine("Patient id is {0},Patient name is {1} , Drug name is {2} ,Time {3}, Department is {4}",medicine.PatientId , medicine.Patient.PatientName,medicine.Drug.DrugName,medicine.Parts,medicine.Patient.Department.DepartmentName);
                    }
                }
                Console.WriteLine("-------------------------------------------------------");
                Console.WriteLine('\t' + "Enter 1 for insert data");
                Console.WriteLine('\t' + "Enter 2 for update data");
                Console.WriteLine('\t' + "Enter 3 for remove data");
                Console.WriteLine('\t' + "Enter 4 for report of patient assigned to a particular doctor");
                Console.WriteLine('\t' + "Enter 5 for report of medicine list for a particular patient");
                Console.WriteLine("--------------------------------------------------------");
                int choice = Convert.ToInt32(Console.ReadLine());
                while(choice != 6){
                    switch (choice)
                    {
                        case 1:
                            insert();
                            break;
                        case 2:
                            update();
                            break;
                        case 3:
                            delete();
                            break;
                        case 4:
                            PatientReport();
                            break;
                        case 5:
                            MedicineReport();
                            break;
                    }
                }
                Console.ReadLine();
            }
        }
    }
}