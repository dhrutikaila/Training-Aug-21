using ToyShop.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ToyShop
{
    class Program
    {
        static void Main(string[] args)
        {
            int Choice;
            do
            {
                Console.WriteLine("Please Enter Appropriate Option: \n\t 1.For Insert a Customer \n\t 2.For Update a Customer \n\t 3.For Delete a Customer \n\t 4.For view all the products \n\t 5.For search Products \n\t 6.For Place an order \n\t 7.Exit");
                Choice = int.Parse(Console.ReadLine());
                if (Choice == 7)
                {
                    break;
                }
                switch (Choice)
                {
                    case 1:
                        //1.For Insert a Customer
                        using (var context = new ToyCompanyContext())
                        {
                            var CustomerObj = new Customer();
                            Console.Write("Please Enter CustomerName : ");
                            CustomerObj.CustomerName = Console.ReadLine();
                            Console.Write("Please Enter Age : ");
                            CustomerObj.Age = Convert.ToByte(Console.ReadLine());
                            Console.Write("Please Enter PhoneNumber : ");
                            CustomerObj.PhoneNumber = Console.ReadLine();
                            context.Customers.Add(CustomerObj);
                            context.SaveChanges();
                            Console.WriteLine("Data Inserted successfully.. ");
                        }
                        break;
                    case 2:
                        //2.For Update a Customer
                        using (var context = new ToyCompanyContext())
                        {
                            Console.WriteLine("Enter Customer Id Which You Want To Upadate");
                            var ID = int.Parse(Console.ReadLine());
                            var CustomerObj = context.Customers.Single(cus => cus.CustomerId == ID);
                            Console.WriteLine("Enter 1.DoctorName 2.Age 3.PhoneNumber");
                            var select = int.Parse(Console.ReadLine());

                            switch (select)
                            {
                                case 1:
                                    Console.Write("Enter New Name : ");
                                    CustomerObj.CustomerName = Console.ReadLine();
                                    context.SaveChanges();
                                    break;
                                case 2:
                                    Console.Write("Enter New Age : ");
                                    CustomerObj.Age = Convert.ToByte(Console.ReadLine());
                                    context.SaveChanges();
                                    break;
                                case 3:
                                    Console.Write("Enter New PhoneNumber : ");
                                    CustomerObj.PhoneNumber = Console.ReadLine();
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
                        //3.For Delete a Customer
                        using (var context = new ToyCompanyContext())
                        {
                            Console.WriteLine("Enter Customer Id Which You Want To Delete");
                            var ID = int.Parse(Console.ReadLine());
                            var CustomerObj = context.Customers.Single(cus => cus.CustomerId == ID);
                            context.Customers.Remove(CustomerObj);
                            context.SaveChanges();
                            Console.WriteLine("Data Deleted successfully.. ");
                        }
                        break;

                    case 4:
                        //4.For view all the products

                        using (var context = new ToyCompanyContext())
                        {
                            Console.WriteLine("---------Product List-------------");
                            var ToysData = context.Toys.ToList();

                            foreach (var item in ToysData)
                            {
                                Console.WriteLine($"ToyId = {item.ToysId} \t || ToyName= {item.ToyName} \t || ToyPrice = {item.UnitPrice} \t || ToyQuantity={item.ToyQuantity}");
                            }

                        }


                        break;

                    case 5:
                        //5.For search Products
                        using (var context = new ToyCompanyContext())
                        {
                            Console.WriteLine("Please Enter ProductName : ");
                            var ProductName = Console.ReadLine();
                            var Data = context.Toys.FromSqlRaw($"sp_ProductList {ProductName}").ToList();
                            foreach (var item in Data)
                            {
                                Console.WriteLine($"ToyId = {item.ToysId} \t || ToyName= {item.ToyName} \t || ToyPrice = {item.UnitPrice} \t || ToyQuantity={item.ToyQuantity}");
                            }
                        }
                        break;

                    case 6:
                        //6.For Place an order
                        using (var context = new ToyCompanyContext())
                        {
                            int ToyId = 0, TotalAmount = 0;
                            byte Quantity = 0;
                            Console.WriteLine("Please Enter CustomerId :");
                            int CustomerID = int.Parse(Console.ReadLine());

                            Console.Write("Please Enter How Many Toys You Want Buy : ");
                            int Count = int.Parse(Console.ReadLine());

                            for (int i = 1; i <= Count; i++)
                            {
                                Console.Write($"Please Enter {i} ToyId : ");
                                ToyId = int.Parse(Console.ReadLine());
                                var ToysObj = context.Toys.Single(Toy => Toy.ToysId == ToyId);
                                Console.Write("Please Enter Quantity : ");
                                Quantity = Convert.ToByte(Console.ReadLine());
                                TotalAmount += (ToysObj.UnitPrice * Quantity);
                            }
                            context.Database.ExecuteSqlRaw($"sp_order {CustomerID} ,{ToyId},{Quantity},{TotalAmount}");

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


