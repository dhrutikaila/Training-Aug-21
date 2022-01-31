using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using ToyCompany.Models;

namespace ToyCompany
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new ToyCompanyDbContext())
            {
                Console.WriteLine("Select a option");
                int choice;
                bool loop = true;
                while (loop)
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
                            string customerFirstName = Console.ReadLine();
                            Console.WriteLine("Enter lastname:");
                            string customerLastName = Console.ReadLine();
                            Console.WriteLine("Enter phonenumber:");
                            string customerContactNUmber = Console.ReadLine();

                            var customer = new Customer()
                            {
                                Name = $"{customerFirstName} {customerLastName}",
                                ContactNumber = customerContactNUmber
                            };
                            context.Customers.Add(customer);
                            context.SaveChanges();
                            break;
                        case 2:
                            Console.WriteLine("Enter customerId:");
                            int customerId = Convert.ToInt32(Console.ReadLine());
                            var customerRemove = context.Customers.Find(customerId);
                            customerRemove.IsActive = false;
                            context.SaveChanges();
                            break;
                        case 3:
                            Console.WriteLine("Enter customerId:");
                            int updateCustomerId = Convert.ToInt32(Console.ReadLine());
                            var updateCustomer = context.Customers.Find(updateCustomerId);
                            Console.WriteLine("Enter Name:");
                            updateCustomer.Name = Console.ReadLine();
                            Console.WriteLine("Enter phonenumber:");
                            updateCustomer.ContactNumber = (Console.ReadLine());
                            context.SaveChanges();
                            break;
                        case 4:
                            var products = context.Toys.Include(s => s.Type).ToList();
                            foreach (var product in products)
                            {
                                Console.WriteLine($"Toy : {product.ToyName}, Price : {product.Price}");
                            }
                            break;
                        case 5:
                            Console.WriteLine("Enter ToyId:");
                            int toyId = Convert.ToInt32(Console.ReadLine());
                            var searchToy = context.Toys.Find(toyId);
                            Console.WriteLine($"ToyId : {searchToy.Id},ToyName : {searchToy.ToyName},Price : {searchToy.Price}, Type: {searchToy.Type.TypeName}");
                            break;
                        case 6:
                            Console.WriteLine("Enter your CustomerId");
                            int currentCustomerId = Convert.ToInt32(Console.ReadLine());
                            int myOrderId = context.OrderHeaders.Count() + 1;
                            Console.WriteLine("Enter City:");
                            string city = Console.ReadLine();
                            Console.WriteLine("Enter State: ");
                            string state = Console.ReadLine();
                            var order = new OrderHeader
                            {
                                CustomerId = 1,
                                OrderDate = DateTime.Now,
                                TotalAmount = 0
                            };

                            var address = new Address
                            {
                                City = city,
                                State = state
                            };
                            context.Addresses.Add(address);
                            var shipping = new ShippingAddress
                            {
                                AddressId = address.Id,
                                OrderHeaderId = myOrderId
                            };
                            context.ShippingAddresses.Add(shipping);
                            context.SaveChanges();
                            int orderChoice;
                            double totalamount = 0;
                            bool innerLoop = true;
                            while (innerLoop)
                            {
                                Console.WriteLine("1.Add Items\n" +
                                                  "2.Exit");
                                orderChoice = Convert.ToInt32(Console.ReadLine());
                                switch (orderChoice)
                                {
                                    case 1:
                                        Console.WriteLine("Enter ToyId:");
                                        int orderToyId = Convert.ToInt32(Console.ReadLine());
                                        Console.WriteLine("Enter Quantity:");
                                        int orderQuantity = Convert.ToInt32(Console.ReadLine());
                                        var orderDetail = new OrderDetail
                                        {
                                            OrderID = myOrderId,
                                            ToyId = orderToyId,
                                            Quantity = orderQuantity
                                        };
                                        context.OrderDetails.Add(orderDetail);
                                        context.SaveChanges();
                                        double toyPrice = (double)context.Toys.Find(orderToyId).Price;
                                        totalamount += toyPrice * orderQuantity;
                                        break;
                                    case 2:
                                        innerLoop = false;
                                        break;
                                    default:
                                        Console.WriteLine("Invalid Choice!");
                                        break;
                                }
                            }

                            order.TotalAmount = (decimal)totalamount;
                            context.OrderHeaders.Add(order);
                            context.SaveChanges();

                            Console.WriteLine($"Order placed SuccessFully and Total amount you have to pay is : {totalamount}");
                            break;
                        case 7:
                            loop = false;
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
