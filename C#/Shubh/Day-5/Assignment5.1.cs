using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_5
{
    class Mobike
    {
        private int Rent, BikeNo, Days;
        private string Name, ContactNo;

        public void Input()
        {
            Console.WriteLine("Your name:");
            Name = Console.ReadLine();
            Console.WriteLine("Your phone no.: ");
            ContactNo = Console.ReadLine();
            Console.WriteLine("Bike Number");
            BikeNo = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("No. of Days for renting the bike: ");
            Days = Convert.ToInt32(Console.ReadLine());
        }
        public void Compute()
        {
            if (Days <= 5)
            { 
                Rent = Days * 500; 
            }     
            else if (Days <= 10)
            {
                Rent = (5 * 500) + ((Days - 5) * 400);
            } 
            else
            {
                Rent = (5 * 500) + (5 * 400) + ((Days - 10) * 200);
            }
        }

        public void Display()
        {
            Console.WriteLine($"Name is {Name}, Contact Number is {ContactNo} Bike Number is {BikeNo}, Bike renting perios is {Days} days and Applicable Rent is {Rent} Rs.");
        }
    }

    class Assignment5.1
    {

        static void Main(string[] args)
        {
            List<Mobike> CList = new List<Mobike>();
            for(var i = 0; i < 3; i++)
            {
                Mobike biker = new Mobike();
                biker.Input();
                biker.Compute();

                CList.Add(biker);
            }

            Console.WriteLine("\nCustomers of Mobike\n");
            foreach (Mobike buyer in CList)
            {
                buyer.Display();
            }

            Console.WriteLine("\nUpdate Mobike Buyer List\n");
            Console.WriteLine("Select 1 to add biker\n Select 2 to delete biker \nSelect 3 to search biker details");
            int userInput = Convert.ToInt32(Console.ReadLine());
            switch (userInput)
            {
                case 1:
                    Mobike biker = new Mobike();
                    biker.Input();
                    biker.Compute();
                    CList.Add(biker);  
                    break;
                case 2:
                    Console.WriteLine("Enter index number to delete biker (Index starts with '0')");
                    var indexDel = Convert.ToInt32(Console.ReadLine());
                    CList.RemoveAt(indexDel);
                    break;
                case 3:
                    Console.WriteLine("Enter index number to Search biker (Index starts with '0')");
                    var indexSearch = Convert.ToInt32(Console.ReadLine());
                    CList[indexSearch].Display();
                    break;

                default:
                    Console.WriteLine("Invalid input");
                    break;
            }
            Console.WriteLine("\n---------------------------------------------\n");
            Console.WriteLine("Final Details of bikers:");
            foreach (Mobike buyer in CList)
                    {
                        buyer.Display();
                    }
            Console.ReadLine();
        }
    }
}
