using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using HospitalTask.Models;
using Microsoft.EntityFrameworkCore;

namespace HospitalTask
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice;
            Console.WriteLine("Does U want Insert,Update or delete a doctor\nThen press 1 or other wise enter any key");
            if(Console.ReadLine() == "1")
            {
                Console.WriteLine("Enter 1 for Inserting a doctor\n" +
                    "Enter 2 for Update a Doctor\n" + 
                    "Enter 3 for Delete a Doctor");

                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        InsertDoctor();
                        break;
                    case 2:
                        UpdateDoctor();
                        break;
                    case 3:
                        DeleteDoctor();
                        break;
                    default:
                        Console.WriteLine("Invalid Choice");
                        break;
                }
            }

            Console.WriteLine("Enter 1 for report patient assigned to a particular doctor");
            Console.WriteLine("Ente 2 for report of medicine list for a particular patient");
            Console.WriteLine("Enter 3 report of Doctor and patient");

            choice = Convert.ToInt32(Console.ReadLine());

            using(var context = new HospitalTaskDBContext())
            {
                switch (choice)
                {
                    case 1:
                        context.Doctors
                            .Join(context.Prescribes,
                            d => d.Id,
                            p => p.DoctorId,
                            (d, p) => new
                            {
                                Doctor = d.FirstName, Patient = p.Patient.FirstName 
                            })
                            .ToList().ForEach(c => Console.WriteLine(c));
                        break;
                    case 2:
                        context.Medications
                            .Join(context.Prescribes,
                            m => m.PrescribeId,
                            p => p.Id,
                            (m, p) => new {
                                Patient = p.Patient.FirstName,
                                Medication = m.Drug.Name,
                                Time = m.DayPart.PartName
                            })
                            .ToList().ForEach(c => Console.WriteLine(c));
                        break;
                    case 3:
                        var collection = context.Prescribes
                            .Include(p => p.Doctor)
                            .Include(p => p.Patient)
                            .ToList();
                        collection.ForEach(c => Console.WriteLine($"Doctor {c.Doctor.FirstName} Patient {c.Patient.FirstName}"));
                        break;
                    default:
                        Console.WriteLine("Invalid Choice");
                        break;
                }
                
            }


            
        }

        private static void DeleteDoctor()
        {
            Console.WriteLine("Enter Id of Doctor to delete");
            int doctorId = Convert.ToInt32(Console.ReadLine());

            using(var context = new HospitalTaskDBContext())
            {
                var doctor = context.Doctors.Find(doctorId);

                if (doctor == null)
                {
                    Console.WriteLine("Sorry the doctor does't exist in the database");
                }
                else
                {
                    Console.WriteLine("the doctor with following detail is deleted");
                    Console.WriteLine($"FirstName: {doctor.FirstName}");
                    Console.WriteLine($"LastName: {doctor.LastName}");
                    Console.WriteLine($"Department: {doctor.DepartmentId}");

                    context.Remove(doctor);
                    context.SaveChanges();
                }
            }
        }

        private static void UpdateDoctor()
        {
            Console.WriteLine("Enter Id of Doctor to update");
            int doctorId = Convert.ToInt32(Console.ReadLine());

            using (var context = new HospitalTaskDBContext())
            {
                var doctor = context.Doctors.Find(doctorId);

                if(doctor == null)
                {
                    Console.WriteLine("Sorry the doctor does't exist in the database");
                }
                else
                {
                    Console.WriteLine("Enter 1 for change firstName\nEnter 2 for change LastName");
                    int choice = Convert.ToInt32(Console.ReadLine());
                    switch (choice)
                    {
                        case 1:
                            Console.WriteLine("Enter firstName");
                            string firstName = Console.ReadLine();
                            Console.WriteLine($"OldFirstName{doctor.FirstName} newFirstName{firstName}");
                            doctor.FirstName = firstName;
                            break;
                        case 2:
                            Console.WriteLine("Enter lastName");
                            string lastName = Console.ReadLine();
                            Console.WriteLine($"OldFirstName{doctor.LastName} newFirstName{lastName}");
                            doctor.LastName = lastName;
                            break;
                        default:
                            Console.WriteLine("Invalid Choice");
                            break;
                    }
                }

                context.SaveChanges();

            }

        }

        private static void InsertDoctor()
        {
            Console.WriteLine("Enter FirstNam of Doctor");
            string firstName = Console.ReadLine();
            Console.WriteLine("Enter LastName of Doctor");
            string lastName = Console.ReadLine();
            Console.WriteLine("Enter DepartmentId of Doctor");
            int departmentId = Convert.ToInt32(Console.ReadLine());

            using (var context = new HospitalTaskDBContext())
            {
                var doctor = new Doctor()
                {
                    FirstName = firstName,
                    LastName = lastName,
                    DepartmentId = departmentId
                };

                context.Doctors.Add(doctor);
                context.SaveChanges();
            }
        }
    }
}
