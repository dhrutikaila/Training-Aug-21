using Day12_13.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
namespace Day12_13
{
    class ToysData
    {
        ToyCompanyContext context = new ToyCompanyContext();
        public void AddUser()
        {
            Console.WriteLine("Enter Customer name :");
            string CustomerName = Console.ReadLine();
            
                List<Customer> customers = new List<Customer>()
                    {
                    new Customer(){CustomerName=CustomerName}
                    };
                context.Customer.AddRange(customers);
                context.SaveChanges();
            Console.WriteLine("Customer Added successfully!!");
        }
        public void UpdateUser()
        {
            Console.WriteLine("Enter Customer id:");
            int CustId = Convert.ToInt32(Console.ReadLine());
            var userFind = context.Customer.Find(CustId);
            Console.WriteLine("Updated name is :");
            string updatedName = Console.ReadLine();
            userFind.CustomerName = updatedName;
            context.SaveChanges();
            Console.WriteLine("Customer Updated successfully!!");
        }
        public void DeleteUser()
        {
            Console.WriteLine("Enter Customer id:");
            int CustId = Convert.ToInt32(Console.ReadLine());
            var userFind = context.Customer.Find(CustId);
            context.Remove(userFind);
            context.SaveChanges();
            Console.WriteLine("Customer Added successfully!!");
        }
        public void products()
        {
            Console.WriteLine("------------Product Details--------------");
            var product = context.Toy.Include(p => p.ToyType)
                                     .ToList();
            Console.WriteLine("ID"+'\t'+"Toy"+'\t'+"Toy Type"+'\t'+"Price"+'\t');
            foreach(var data in product)
            {
                Console.WriteLine(data.ToyId +"      "+ data.ToyName + '\t' + data.ToyType.TypeName + '\t' + '\t' + data.Price+ '\t'  );
            }
        }
        public void search()
        {
            Console.WriteLine("Enter the toy type which you want to find");
            string type = Console.ReadLine();
            var toy = context.Toy.Include(p => p.ToyType).ThenInclude(p=>p.Plant)
                                        .Where(p=>p.ToyType.TypeName==type)
                                        .ToList();
            Console.WriteLine( "Toy"  + '\t' + "Price" + '\t'+"Plant place");
            foreach (var data in toy)
            {
                Console.WriteLine(data.ToyName + '\t' + data.Price + '\t'+data.ToyType.Plant.PlantPlace);
            }
        }
        public void PlaceOrder()
        {
            Console.WriteLine("Enter customername");
            string name = Console.ReadLine();
            //var cname = context.Customer;
            
        }
    }
        class Program
        {
            static void Main(string[] args)
            {
                //store procedure example
                var context = new ToyCompanyContext();
                //Console.WriteLine("enter address id");
                //int id = Convert.ToInt32(Console.ReadLine());
                //var cusdata = context.Customer.FromSqlRaw("GetCustomerAddress '3'").ToList();
                ToysData td = new ToysData();
                Console.WriteLine("----------------------------------------------------------");
                Console.WriteLine('\t' + "1.Register User(Add Customer)");
                Console.WriteLine('\t' + "2.Update User(Update Customer)");
                Console.WriteLine('\t' + "3.Delete User(Delete Customer)");
                Console.WriteLine('\t' + "4.View Products");
                Console.WriteLine('\t' + "5.Search Record");
                Console.WriteLine('\t' + "6.Place Order");
                Console.WriteLine("----------------------------------------------------------");
                Console.WriteLine("Enter your choice !");
                int choice = Convert.ToInt32(Console.ReadLine());
                while (choice != 7)
                {
                    switch (choice)
                    {
                        case 1:
                            td.AddUser();
                            break;
                        case 2:
                            td.UpdateUser();
                            break;
                        case 3:
                            td.DeleteUser();
                            break;
                        case 4:
                            td.products();
                            break;
                        case 5:
                        td.search();
;                            break;
                        case 6:
                        td.PlaceOrder();
                        break;

                        default:
                            Console.WriteLine("Enter valid choice");
                            break;
                    }
                    Console.WriteLine("----------------------------------------------------------");
                    Console.WriteLine('\t' + "1.Register User(Add Customer)");
                    Console.WriteLine('\t' + "2.Update User(Update Customer)");
                    Console.WriteLine('\t' + "3.Delete User(Delete Customer)");
                    Console.WriteLine('\t' + "4.View Products");
                    Console.WriteLine('\t' + "5.Search Record");
                    Console.WriteLine('\t' + "6.Place Order");
                    Console.WriteLine("----------------------------------------------------------");
                    Console.WriteLine("Enter your choice !");
                    choice = Convert.ToInt32(Console.ReadLine());
                }
                Console.ReadLine();
            }
        }
    }


