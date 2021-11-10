//Rambo Rental Bikes is looking for developing a system to calculate the rentals of the bikes.
//System should accept the customer details, bike details and calculate the rental charges.
// DESCRIPTION OF PROJECTS
//System allows users to add customer details with bike rented. It computes rent for each customer.
//Systems displays the Bike details with summation of days of hire and rental payment.
//FUNCTIONALITY AND TASK
//Define a class called Mobike with the following description: 
//Instance variables/data members: 
//BikeNumber – to store the bike’s number
//PhoneNumber – to store the phone number of the customer
//Name – to store the name of the customer
//Days – to store the number of days the bike is taken on rent
//charge – to calculate and store the rental charge
//Member methods:
//void Input() – to input and store the detail of the customer.
//void Compute( ) – to compute the rental charge
//void display( ) – to display the details in the following format:
// Bike No.PhoneNo             No.of days         Charge
// The rent for a mobike is charged on the following basis:
//First five days Rs 500 per day
//Next five days Rs 400 per day
//Rest of the days Rs 200 per day
//Use collection Framework to store 10 Customer Details. Implement List operation add, delete, edit and search functionality

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day5
{
    class Mobike
    {
        int bikeno, days;
        long phoneno;
        string name;
        float charges;

        public void Input()
        {
            Console.WriteLine("Enter bike number:");
            bikeno = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter phone number:");
            phoneno = Convert.ToInt64(Console.ReadLine());
            Console.WriteLine("Enter customer name:");
            name = Console.ReadLine();
            Console.WriteLine("Enter no of days:");
            days = Convert.ToInt32(Console.ReadLine());
        }

        public void Compute()
        {
            charges = 0;
            for(int i = 1; i <= days; i++)
            {
                if (i <= 5)
                {
                    charges += 500;
                }
                else if(i>5 && i <= 10)
                {
                    charges += 400;
                }
                else
                {
                    charges += 200;
                }
            }
        }

        public void Display()
        {
            Console.WriteLine($"{bikeno}|{phoneno}|{days}|{charges}");
        }
    }
    class Assignment
    {
        static void Displaylist(object o)
        {
            List<Mobike> custlist = (List<Mobike>)o;
            Console.WriteLine("Bike No. | Phone No. | No of Days | Charges");
            foreach (Mobike i in custlist)
            {
                i.Display();
            }
        }
        static void Main(string[] args)
        {
            List<Mobike> custlist = new List<Mobike>();
            for (int i = 0; i < 10; i++)
            {
                Mobike m = new Mobike();
                m.Input();
                m.Compute();
                custlist.Add(m);
            }
            Displaylist(custlist);

            int flag = 1;
            while (flag == 1)
            {
                Console.WriteLine("Select Operation:\n1.Add\n2.Delete\n3.Edit\n4.Search\n5.Exit");
                int op = Convert.ToInt32(Console.ReadLine());
                switch (op)
                {
                    case 1:
                        Mobike m = new Mobike();
                        m.Input();
                        m.Compute();
                        custlist.Add(m);
                        Console.WriteLine("Updated List");
                        Displaylist(custlist);
                        break;
                    case 2:
                        Console.WriteLine("Enter index you want to delete:");
                        int delindex = Convert.ToInt32(Console.ReadLine());
                        if (delindex < custlist.Count)
                        {
                            custlist.RemoveAt(delindex);
                            Console.WriteLine("Updated List");
                            Displaylist(custlist);
                        }
                        else
                        {
                            Console.WriteLine("Invalid Index!");
                        }
                        break;
                    case 3:
                        Console.WriteLine("Enter index you want to edit:");
                        int editindex = Convert.ToInt32(Console.ReadLine());
                        if (editindex < custlist.Count)
                        {
                            custlist[editindex].Input();
                            custlist[editindex].Compute();
                            Console.WriteLine("Updated List");
                            Displaylist(custlist);
                        }
                        else
                        {
                            Console.WriteLine("Invalid Index!");
                        }
                        break;
                    case 4:
                        Console.WriteLine("Enter index you want to Search:");
                        int searchindex = Convert.ToInt32(Console.ReadLine());
                        if (searchindex < custlist.Count)
                        {
                            Console.WriteLine("Bike No. | Phone No. | No of Days | Charges");
                            custlist[searchindex].Display();
                        }
                        else
                        {
                            Console.WriteLine("Invalid Index!");
                        }
                        break;
                    case 5:
                            flag = 0;
                            break;
                    default:
                        Console.WriteLine("Invalid Choice!!");
                        break;
                }
            }

            Console.ReadKey();
        }
    }
}