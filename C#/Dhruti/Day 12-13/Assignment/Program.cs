using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ToyShop.Models;
using Microsoft.EntityFrameworkCore;

namespace ToyShop
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new ToyCompanyContext())
            {
                Console.WriteLine("Welcome to Toy Company!!\nPlease select option from following:");
                int choice;
                int flag = 1;
                while (flag == 1)
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
                            Console.WriteLine("Enter phonenumber:");
                            int custphone = Convert.ToInt32(Console.ReadLine());
                            var customer = new Customer()
                            {
                                firstName = custfname,
                                lastName = custlname,
                                phoneNumber = custphone,
                            };
                            context.Customers.Add(customer);
                            context.SaveChanges();
                            break;
                        case 2:
                            Console.WriteLine("Enter customerId:");
                            int rmvcustid = Convert.ToInt32(Console.ReadLine());
                            var rmvcustobj = context.Customers.Find(rmvcustid);
                            rmvcustobj.isActive = false;
                            context.SaveChanges();
                            break;
                        case 3:
                            Console.WriteLine("Enter customerId:");
                            int editcustid = Convert.ToInt32(Console.ReadLine());
                            var editcustobj = context.Customers.Find(editcustid);
                            Console.WriteLine("Enter first:");
                            editcustobj.firstName = Console.ReadLine();
                            Console.WriteLine("Enter lastname:");
                            editcustobj.lastName = Console.ReadLine();
                            Console.WriteLine("Enter phonenumber:");
                            editcustobj.phoneNumber = Convert.ToInt32(Console.ReadLine());
                            context.SaveChanges();
                            break;
                        case 4:
                            var products = context.Toys.FromSqlRaw($"EXEC GetProductDetails").ToList();
                            foreach (var product in products)
                            {
                                Console.WriteLine($"Toy : {product.toyName}, Price : {product.toyPrice}");
                            }
                            break;
                        case 5:
                            Console.WriteLine("Enter ToyId:");
                            int toyId = Convert.ToInt32(Console.ReadLine());
                            var searchToy = context.Toys.Find(toyId);
                            Console.WriteLine($"ToyId : {searchToy.toyId},ToyName : {searchToy.toyName},Price : {searchToy.toyPrice},Manufatured at : {searchToy.ToyPlantNavigation.plantName},{searchToy.ToyPlantNavigation.plantCity}");
                            break;
                        case 6:
                            int myorderid = context.Orders.Count() + 1;
                            Console.WriteLine("Enter addressId:");
                            int orderaddrid = Convert.ToInt32(Console.ReadLine());
                            var order = new Order()
                            {
                                addressId = orderaddrid
                            };
                            context.Orders.Add(order);
                            context.SaveChanges();
                            int choice1;
                            double totalamount = 0;
                            int flag1 = 1;
                            while (flag1 == 1)
                            {
                                Console.WriteLine("1.Add Items\n" +
                                                  "2.Exit");
                                choice1 = Convert.ToInt32(Console.ReadLine());
                                switch (choice1)
                                {
                                    case 1:
                                        Console.WriteLine("Enter ToyId:");
                                        int ordertoyid = Convert.ToInt32(Console.ReadLine());
                                        Console.WriteLine("Enter Quantity:");
                                        int orderquantity = Convert.ToInt32(Console.ReadLine());
                                        var item = new Item()
                                        {
                                            toyId = ordertoyid,
                                            quantity = orderquantity,
                                            orderId = myorderid
                                        };
                                        context.Items.Add(item);
                                        context.SaveChanges();
                                        double toyprice = context.Toys.Find(ordertoyid).toyPrice;
                                        totalamount += toyprice * orderquantity;
                                        break;
                                    case 2:
                                        flag1 = 0;
                                        break;
                                    default:
                                        Console.WriteLine("Invalid Choice!");
                                        break;
                                }
                            }
                            Console.WriteLine($"Order placed SuccessFully and Total amount you have to pay is : {totalamount}");
                            break;
                        case 7:
                            flag = 0;
                            break;
                        default:
                            Console.WriteLine("Invalid Choice!");
                            break;
                    }
                }
                context.SaveChanges();

            }
            Console.ReadKey();
        }
    }
}