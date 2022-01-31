//Rambo Rental Bikes is looking for developing a system to calculate the rentals of the bikes. System should accept the customer details, bike details and calculate the rental charges.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_5
{
    class Mobike
    {
        private int BikeNumber, Days, Charge;
        private string Name, PhoneNumber;

        public void Input()
        {
            Console.WriteLine("Enter Name of customer");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Phone Number of customer");
            PhoneNumber = Console.ReadLine();
            Console.WriteLine("Enter Bike Number");
            BikeNumber = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("For how many days customer wants to rent a bike");
            Days = Convert.ToInt32(Console.ReadLine());
        }
        public void Compute()
        {
            if (Days <= 5)
            { 
                Charge = Days * 500; 
            }     
            else if (Days <= 10)
            {
                Charge = (5 * 500) + ((Days - 5) * 400);
            } 
            else
            {
                Charge = (5 * 500) + (5 * 400) + ((Days - 10) * 200);
            }
        }

        public void Display()
        {
            Console.WriteLine($"Customer name is {Name}, Phone number is {PhoneNumber} Bike Number is {BikeNumber}, days of renting a bike is {Days} and Charge is {Charge}");
        }
    }

    class Assignment1_Day5
    {

        static void Main(string[] args)
        {
            List<Mobike> CustList = new List<Mobike>();
            for(var i = 0; i < 3; i++)
            {
                Mobike customer = new Mobike();
                customer.Input();
                customer.Compute();

                CustList.Add(customer);
            }

            Console.WriteLine("\n---------------------------------------------\n");
            foreach (Mobike buyer in CustList)
            {
                buyer.Display();
            }

            Console.WriteLine("\n+++++++++++++++++++++++++++++++++++++++++++++\n");
            Console.WriteLine("Select 1 to add customer and 2 to delete customer 3 to search customer detail ");
            int userInput = Convert.ToInt32(Console.ReadLine());
            switch (userInput)
            {
                case 1:
                    Mobike customer = new Mobike();
                    customer.Input();
                    customer.Compute();
                    CustList.Add(customer);  
                    break;
                case 2:
                    Console.WriteLine("Enter index number to delete customer (Index starts with '0')");
                    var indexDel = Convert.ToInt32(Console.ReadLine());
                    CustList.RemoveAt(indexDel);
                    break;
                case 3:
                    Console.WriteLine("Enter index number to Search customer (Index starts with '0')");
                    var indexSearch = Convert.ToInt32(Console.ReadLine());
                    CustList[indexSearch].Display();
                    break;

                default:
                    Console.WriteLine("Invalid input");
                    break;
            }
            Console.WriteLine("\n---------------------------------------------\n");
            Console.WriteLine("Final Details of Customers:");
            foreach (Mobike buyer in CustList)
                    {
                        buyer.Display();
                    }
            Console.ReadLine();
        }
    }
}
