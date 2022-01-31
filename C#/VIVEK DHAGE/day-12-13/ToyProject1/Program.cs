using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using ToyProject1.Models;

namespace ToyProject1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello There!");

            using (var context = new ToysDbContext()) {
             
                
                // adding customer
                //List<Customer> customers = new List<Customer>() {
                //new Customer(){Name="bhavesh", MobileNumber =63785973}
                //};
             

                //context.Customers.AddRange(customers);
                //context.SaveChanges();


                ////removing customer
                //var rem = context.Customers.Where(a => a.Name.Contains("bhavesh"));
                //context.Customers.RemoveRange(rem);
                //context.SaveChanges();


                ////updating customer
                //var customer = context.Customers.First<Customer>();
                //customer.Name = "virat";
                //context.SaveChanges();



                //getting the customer
                // Find a report of patient assigned to a particular doctor


                //var products = context.Toys.Include(a => a.Orders).ToList();
                //foreach (var i in products)
                //{
                //    Console.WriteLine($"toy name:  {i.ToyName}, Price: {i.ToyPrice} , type{i.ToyType}");

                //}

                //;
                //                var summ1 = context.Doctors.Include(Pre => Pre.Prescribes)
                //                                   .ThenInclude(doc => doc.Patient).Where(doc => doc.FirstName == "Ritesh")
                //                                   .ToList();

                //                foreach (var i in summ1)
                //                {
                //                    Console.WriteLine($"Doctors {i.FirstName}: has patients as follow:- ");

                //                    foreach (var j in i.Prescribes)
                //                    {
                //                        Console.WriteLine("Patients name: " + j.Patient.FirstName);
                //                    }
                //                }



                Console.WriteLine("enter your id to see records");
                int cus_id = Convert.ToInt32(Console.ReadLine());

                
                    var entity = context.Customers.FirstOrDefault(item => item.CustomerId == cus_id);

                    if (cus_id != entity.CustomerId)
                    {
                        Console.WriteLine("id is not matching");
                    }
                    else
                    {

                    if (entity != null)
                        
                    Console.WriteLine("{0} {1} ", entity.Name, entity.MobileNumber);
                    Console.ReadKey();
                }






                // place order
                Console.WriteLine("enter your id to place order");
                int cus_id1 = Convert.ToInt32(Console.ReadLine());


                var check_customer = context.Customers.FirstOrDefault(item => item.CustomerId == cus_id1);

                if (cus_id1 != entity.CustomerId)
                {
                    Console.WriteLine("id is not matching");
                    Console.WriteLine("create new id ");
                    Console.WriteLine("enter name");
                    string c_name = Console.ReadLine();
                    Console.WriteLine("enter mobile num");
                    int mob_num = Convert.ToInt32(Console.ReadLine());

                    List<Customer> customers = new List<Customer>() {
                    new Customer(){Name=c_name, MobileNumber =mob_num}
                    };


                    context.Customers.AddRange(customers);
                }
                else
                {
                    // adding customer
                    //List<Customer> customers = new List<Customer>() {
                    //new Customer(){Name="bhavesh", MobileNumber =63785973}
                    //};


                    //context.Customers.AddRange(customers);
                    //context.SaveChanges();
                    Console.WriteLine("enter TOY ID"); int toy_id = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("enter TOY quantity"); int toy_quantity = Convert.ToInt32(Console.ReadLine());
                    List<Purchase> purchases = new List<Purchase>() {
                    new Purchase(){Quantity= toy_quantity,ToysId = toy_id}
                    };



                    context.Purchases.AddRange(purchases);

                    context.SaveChanges();
                }





                ////Update a Doctor


                //var doctor = context.Doctors.First<Doctor>();
                //doctor.FirstName = "nilesh";
                //context.SaveChanges();

                ////Delete a Doctor


                //var rem = context.Doctors.Where(a => a.FirstName.Contains("hiren"));
                //context.Doctors.RemoveRange(rem);
                //context.SaveChanges();
            }

        }
    }
}
