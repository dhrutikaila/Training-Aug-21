using System;
using System.Collections.Generic;
using System.Linq;
using HospitalProject_Console.Models;
using Microsoft.EntityFrameworkCore;

namespace HospitalProject_Console
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            using (var context = new HospitaloneDBContext()) {

                //Insert a Doctor


                //List <Doctor> doctors = new List<Doctor>() { 
                //    new Doctor(){ FirstName = "hiren", LastName = "parekh"},
                //    new Doctor(){ FirstName = "Bharat", LastName = "Kumar"}
                //};
                //context.Doctors.AddRange(doctors);
                //context.SaveChanges();

                ////Update a Doctor


                //var doctor = context.Doctors.First<Doctor>();
                //doctor.FirstName = "nilesh";
                //context.SaveChanges();

                ////Delete a Doctor


                //var rem = context.Doctors.Where(a => a.FirstName.Contains("hiren"));
                //context.Doctors.RemoveRange(rem);
                //context.SaveChanges();


                 // Find a report of patient assigned to a particular doctor


                var summ1 = context.Doctors.Include(Pre=> Pre.Prescribes)
                                   .ThenInclude(doc=> doc.Patient).Where(doc=>doc.FirstName=="Ritesh")
                                   .ToList();

                foreach (var i in summ1) 
                {
                    Console.WriteLine($"Doctors {i.FirstName}: has patients as follow:- ");

                    foreach (var j in i.Prescribes) {
                        Console.WriteLine("Patients name: "+ j.Patient.FirstName);
                    }
                }

                // Find a report of medicine list for a particular patient

                var summ2 = context.Patients.Include(Pre => Pre.Prescribes)
                                .ThenInclude(doc => doc.Drug).Where(doc => doc.FirstName == "ravi")
                                .ToList();

                foreach (var i in summ2)
                {
                    Console.WriteLine($"Patient {i.FirstName}: has prescribed following drugs :- ");

                    foreach (var j in i.Prescribes)
                    {
                        Console.WriteLine("Drugs name: " + j.Drug.Name);
                    }
                }




                //Display summary report of Doctor and patient(use Include method)



                var report_Patient = context.Patients.Include(doc => doc.Prescribes)
                                   .ThenInclude(doc => doc.Drug)
                                   .ToList();

                var report_Doctor= context.Doctors.Include(doc => doc.Prescribes)
                                   .ThenInclude(doc => doc.Patient)
                                   .ToList();


                Console.WriteLine("SUMMARY REPORTS");

                Console.WriteLine("1.Report Of Patient");
                foreach (var i in report_Patient)
                {
                    Console.WriteLine($"Patient {i.FirstName}: has prescription of drug:  ");

                    foreach (var j in i.Prescribes)
                    {
                        Console.WriteLine($" Drug Id: {j.Drug.Id} and Name: {j.Drug.Name}" );
                    }
                }

                Console.WriteLine("1.Report Of Doctor");
                foreach (var i in report_Doctor)
                {
                    Console.WriteLine($"Doctor {i.FirstName} {i.LastName} has Patients:  ");

                    foreach (var j in i.Prescribes)
                    {
                        Console.WriteLine($" Patients Id: {j.Patient.Id} and Name: {j.Patient.FirstName}");
                    }
                }



            }
        }
    }
}
