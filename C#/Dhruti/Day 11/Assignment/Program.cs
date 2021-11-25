
using Hospital_Mange.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;

namespace Hospital_Mange
{
 

    
        class Program
        {
            static void Main(string[] args)
            {
                int Choice;
                do
                {
                    Console.WriteLine("Please Enter Appropriate Option: \n\t 1.For Insert a Doctor \n\t 2.For Update a Doctor \n\t 3.For Delete a Doctor \n\t 4.For Find A Report Of Patient Assigned To A Particular Doctor \n\t 5.For Find A Report Of Medicine List For A Particular Patient \n\t 6.For Display summary report of Doctor and patient \n\t 7.Exit");
                    Choice = int.Parse(Console.ReadLine());
                    if (Choice == 7)
                    {
                        break;
                    }
                    switch (Choice)
                    {
                        case 1:
                        //1.For Insert a Doctor
                        using (var context = new HOSPITALContext())
                            {
                                var DoctorObj = new Doctor();
                                Console.Write("Please Enter DoctorName : ");
                                DoctorObj.DoctorName = Console.ReadLine();
                                Console.Write("Please Enter Age : ");
                                DoctorObj.Age = Convert.ToByte(Console.ReadLine());
                                Console.Write("Please Enter Gender : \n\t 1.For Male \n\t 2.For Female \n\t 3.For Other : ");
                                DoctorObj.Gender = Convert.ToByte(Console.ReadLine());
                                Console.Write("Please Enter PhoneNumber : ");
                                DoctorObj.PhoneNumber = Console.ReadLine();
                                Console.Write("Please Enter Address : ");
                                DoctorObj.Address = Console.ReadLine();
                                context.Doctors.Add(DoctorObj);
                                context.SaveChanges();
                                Console.WriteLine("Data Inserted successfully.. ");
                            }
                            break;
                        case 2:
                            //2.For Update a Doctor
                            using (var context = new HOSPITALContext())
                            {
                                Console.WriteLine("Enter Docter Id Which You Want To Upadate");
                                var ID = int.Parse(Console.ReadLine());
                                var DoctorObj = context.Doctors.Single(Dr => Dr.DoctorId == ID);
                                Console.WriteLine("Enter 1.DoctorName 2.Age 3.Gender 4.PhoneNumber 5.Address");
                                var select = int.Parse(Console.ReadLine());

                                switch (select)
                                {
                                    case 1:
                                        Console.Write("Enter New Name : ");
                                        DoctorObj.DoctorName = Console.ReadLine();
                                        context.SaveChanges();
                                        break;
                                    case 2:
                                        Console.Write("Enter New Age : ");
                                        DoctorObj.Age = Convert.ToByte(Console.ReadLine());
                                        context.SaveChanges();
                                        break;
                                    case 3:
                                        Console.Write("Enter New Gender : \n\t 1.For Male \n\t 2.For Female \n\t 3.For Other : ");
                                        DoctorObj.Gender = Convert.ToByte(Console.ReadLine());
                                        context.SaveChanges();
                                        break;
                                    case 4:
                                        Console.Write("Enter New PhoneNumber : ");
                                        DoctorObj.PhoneNumber = Console.ReadLine();
                                        context.SaveChanges();
                                        break;
                                    case 5:
                                        Console.Write("Enter New Address : ");
                                        DoctorObj.Address = Console.ReadLine();
                                        context.SaveChanges();
                                        break;
                                    default:
                                        Console.WriteLine("Please Select Appropriate Option.. ");
                                        break;
                                }

                                Console.WriteLine("Data Update successfully.. ");
                            }
                            break;
                        case 3:
                            //3.For Delete a Doctor
                            using (var context = new HOSPITALContext())
                            {
                                Console.WriteLine("Enter Docter Id Which You Want To Delete");
                                var ID = int.Parse(Console.ReadLine());
                                var DoctorObj = context.Doctors.Single(Dr => Dr.DoctorId == ID);
                                context.Doctors.Remove(DoctorObj);
                                context.SaveChanges();
                                Console.WriteLine("Data Deleted successfully.. ");
                            }
                            break;
                        case 4:
                            //4.For Find A Report Of Patient Assigned To A Particular Doctor
                            using (var context = new HOSPITALContext())
                            {
                                Console.WriteLine("---------------------------------------------------");
                                var Data = context.PatientsDoctors.ToList();
                                foreach (var item in Data)
                                {
                                    Console.WriteLine($"PatientName={item.PatientName} \t || \t DoctorName={item.DoctorName}");
                                }
                                Console.WriteLine("--------------------------------------------------");
                            }
                            break;
                        case 5:
                            //5.For Find A Report Of Medicine List For A Particular Patient
                            using (var context = new HOSPITALContext())
                            {
                                Console.WriteLine("---------------------------------------------------");
                                var MedicineList = context.MedicineLists.ToList();
                                foreach (var item in MedicineList)
                                {
                                    Console.WriteLine($"PatientName={item.PatientName} \t || \t MedicineName={item.MedicineList1}");
                                }
                                Console.WriteLine("--------------------------------------------------");

                            }
                            break;
                        case 6:
                            //6.For Display summary report of Doctor and patient(use Include method)
                            using (var context = new HOSPITALContext())
                            {
                                Console.WriteLine("--------------------------------------------------");
                                Console.WriteLine("Please Enter Appropriate Option: \n\t 1.For Summary Report Of Doctor \n\t 2.For Summary Report Of Patient");
                                int ReportChoice = int.Parse(Console.ReadLine());
                                Console.WriteLine("--------------------------------------------------");

                                switch (ReportChoice)
                                {
                                    case 1:
                                        //1.For Summary Report Of Doctor
                                        Console.WriteLine("--------------------------------------------------");
                                        var DoctorReport = context.Doctors
                                            .Include(dr => dr.Treatments)
                                            .ThenInclude(pt => pt.Patient)
                                            .ToList();
                                        foreach (var item in DoctorReport)
                                        {
                                            Console.WriteLine($"DoctorName={item.DoctorName} ");

                                            foreach (var Data in item.Treatments)
                                            {
                                                Console.WriteLine($"\t PatientName={Data.Patient.PatientName}");
                                            }
                                        }
                                        Console.WriteLine("--------------------------------------------------");
                                        break;

                                    case 2:
                                        //2.For Summary Report Of Patient
                                        Console.WriteLine("--------------------------------------------------");
                                        var PatientReport = context.Patients
                                            .Include(pt => pt.Treatments)
                                            .ThenInclude(dr => dr.Doctor)
                                            .ToList();
                                        foreach (var item in PatientReport)
                                        {
                                            Console.WriteLine($"PatientName={item.PatientName} ");

                                            foreach (var Data in item.Treatments)
                                            {
                                                Console.WriteLine($"\t DoctorName={Data.Doctor.DoctorName}");
                                            }
                                        }
                                        Console.WriteLine("--------------------------------------------------");
                                        break;
                                    default:
                                        Console.WriteLine("Please Select Appropriate Option.. ");
                                        break;
                                }

                            }
                            break;

                        default:
                            Console.WriteLine("Please Select Appropriate Option.. ");
                            break;
                    }
                } while (true);
            }
        }
    }



    

