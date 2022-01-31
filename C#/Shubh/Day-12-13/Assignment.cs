using Day12.ToyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day12
{
    public class Assignment
    {
        static void Main(string[] args)
        {
            using (var context = new ToysContext())
            {
                Console.WriteLine("Please select from below!!");
                int choice;
                int exitiing = 1;
                while (exitiing == 1)
                {
                    Console.WriteLine("1.Add Customer\n" +
                                      "2.Remove Customer\n" +
                                      "3.Update Customer\n" +
                                      "4.View Toys\n" +
                                      "5.Search Toy\n" +
                                      "6.Place an Order\n" +
                                      "7.Exit");
                    choice = Convert.ToInt32(Console.ReadLine());
                    switch (choice)
                    {
                        case 1:
                            Console.WriteLine("Enter firstname:");
                            string custfname = Console.ReadLine();
                            Console.WriteLine("Enter lastname:");
                            string custlname = Console.ReadLine();
                            Console.WriteLine("Enter mobile:");
                            int custphone = Convert.ToInt32(Console.ReadLine());
                            Console.WriteLine("Enter username:");
                            string userName = Console.ReadLine();
                            var customer = new Customers()
                            {
                                FirstName = custfname,
                                LastName = custlname,
                                MobileNumber = custphone,
                                UserName=userName,
                            };
                            context.Customers.Add(customer);
                            context.SaveChanges();
                            break;
                        case 2:
                            Console.WriteLine("Enter customerId to remove");
                            int custId = Convert.ToInt32(Console.ReadLine());
                            var customerRemove = context.Customers.Find(custId);
                            customerRemove.IsActive = false;
                            context.SaveChanges();
                            break;
                        case 3:
                            Console.WriteLine("Enter customerId to edit");
                            int editCustId = Convert.ToInt32(Console.ReadLine());
                            var editCust = context.Customers.Find(editCustId);
                            Console.WriteLine("Enter firstName:");
                            editCust.FirstName = Console.ReadLine();
                            Console.WriteLine("Enter lastname:");
                            editCust.LastName = Console.ReadLine();
                            Console.WriteLine("Enter mobile:");
                            editCust.MobileNumber = Convert.ToInt32(Console.ReadLine());
                            Console.WriteLine("Enter username:");
                            editCust.UserName= Console.ReadLine();
                            context.SaveChanges();
                            break;

                    }
                }
            }
        }
    }
}
//modelBuilder.Entity<Grade>()
//    .HasMany<Student>(g => g.Students)
//    .WithOne(s => s.Grade)
//    .HasForeignKey(s => s.CurrentGradeId);
