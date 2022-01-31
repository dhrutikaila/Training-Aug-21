using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AssignmentsDay11.Models;
using Microsoft.EntityFrameworkCore;

namespace AssignmentsDay11
{
    class Assignment
    {
        static void Main(string[] args)
        {
            using (var context = new HealthCareContext())
            {
                Console.WriteLine("Welcome to HealthCare!!\nPlease select option from following:");
                Console.WriteLine("1.Add Doctor\n" +
                                  "2.Remove Doctor\n" +
                                  "3.Update Doctor\n" +
                                  "4.Get report of patient assigned to a particular doctor\n" +
                                  "5.Get report of medicine list for a particular patient\n" +
                                  "6.Summary report of Doctor and patient");
                int choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        Console.WriteLine("Enter FirstName:");
                        string drfname = Console.ReadLine();
                        Console.WriteLine("Enter LastName:");
                        string drlname = Console.ReadLine();
                        Console.WriteLine("Enter Designation:");
                        string drdesignation = Console.ReadLine();
                        Console.WriteLine("Enter Experience(in years):");
                        int drexperience = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Enter DepartmentId:");
                        int drdept = Convert.ToInt32(Console.ReadLine());
                        var dr = new Doctors()
                        {
                            FirstName = drfname,
                            LastName = drlname,
                            Designation = drdesignation,
                            YearsOfExperience = drexperience,
                            Department = drdept,
                        };
                        context.Doctors.Add(dr);
                        context.SaveChanges();
                        break;
                    case 2:
                        Console.WriteLine("Enter DoctorId:");
                        int rmvdrid = Convert.ToInt32(Console.ReadLine());
                        var rmvdrobj = context.Doctors.Find(rmvdrid);
                        rmvdrobj.IsActive = false;
                        context.SaveChanges();
                        break;
                    case 3:
                        Console.WriteLine("Enter DoctorId:");
                        int editdrid = Convert.ToInt32(Console.ReadLine());
                        var editdrobj = context.Doctors.Find(editdrid);
                        Console.WriteLine("Enter FirstName:");
                        editdrobj.FirstName = Console.ReadLine();
                        Console.WriteLine("Enter LastName:");
                        editdrobj.LastName = Console.ReadLine();
                        Console.WriteLine("Enter Designation:");
                        editdrobj.Designation = Console.ReadLine();
                        Console.WriteLine("Enter Experience(in years):");
                        editdrobj.YearsOfExperience = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Enter DepartmentId:");
                        editdrobj.Department = Convert.ToInt32(Console.ReadLine());
                        context.SaveChanges();
                        break;
                    case 4:
                        Console.WriteLine("Enter DoctorId:");
                        int drid1 = Convert.ToInt32(Console.ReadLine());
                        var report1 = context.Treatment.Include(t => t.PatientNavigation).Include(t => t.DoctorNavigation).Where(t => t.Doctor == drid1);
                        foreach (var item in report1)
                        {
                            Console.WriteLine("Doctor : " + item.DoctorNavigation.FirstName + ", Pateint : " + item.PatientNavigation.FirstName);
                        }
                        break;
                    case 5:
                        Console.WriteLine("Enter PatientId:");
                        int drid2 = Convert.ToInt32(Console.ReadLine());
                        var report2 = context.PatientTakesMedicine.Include(t => t.PatientNavigation).Include(t => t.DrugNavigation).Where(t => t.Patient == 2);
                        foreach (var item in report2)
                        {
                            Console.WriteLine("Patient : " + item.PatientNavigation.FirstName + ", Drug : " + item.DrugNavigation.DrugName);
                        }
                        break;
                    case 6:
                        var report3 = context.Treatment.Include(t => t.PatientNavigation).Include(t => t.DoctorNavigation).Where(t => t.DoctorNavigation != null);
                        foreach (var item in report3)
                        {
                            Console.WriteLine("Patient : " + item.PatientNavigation.FirstName + ", Doctor : " + item.DoctorNavigation.FirstName);
                        }
                        break;
                    default:
                        Console.WriteLine("Invalid Choice!");
                        break;
                }
            }
            Console.ReadKey();
        }
    }
}