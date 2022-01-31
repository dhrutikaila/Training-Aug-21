//Rambo Rental Bikes is looking for developing a system to calculate the rentals of the bikes. System should accept the customer details, bike details and calculate the rental charges.
// DESCRIPTION OF PROJECTS
//System allows users to add customer details with bike rented. It computes rent for each customer. Systems displays the Bike details with summation of days of hire and rental payment. FUNCTIONALITY AND TASK
//Define a class called Mobike with the following description: 
//Instance variables/data members: 
//BikeNumber – to store the bike’s number
//PhoneNumber – to store the phone number of the customer
//Name – to store the name of the customer
//Days – to store the number of days the bike is taken on rent o charge – to calculate and store the rental charge
//Member methods:
//void Input() – to input and store the detail of the customer.
//void Compute( ) – to compute the rental charge
//void display( ) – to display the details in the following format:
// Bike No. PhoneNo No.of days Charge
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
        string BikeNumber;
        string PhoneNumber;
        string Name;
        int Days;
        int Charge;

        public void Input(int Count)
        {
            Console.WriteLine("-----Enter {0} customer Details-----", Count);
            Console.Write("Please Enter {0} Customer Name : ", Count);
            Name = Console.ReadLine();
            Console.Write("Please Enter {0} Customer PhoneNumber : ", Count);
            PhoneNumber = Console.ReadLine();
            Console.Write("Please Enter {0} Customer BikeNumber : ", Count);
            BikeNumber = Console.ReadLine();
            Console.Write("Please Enter {0} Customer Days : ", Count);
            Days = int.Parse(Console.ReadLine());
        }

        public void Compute()
        {
            if (Days <= 5)
            {
                Charge = Days * 500;
            }
            else if (Days > 5 && Days <= 10)
            {
                Charge = (5 * 500) + ((Days - 5) * 400);
            }
            else
            {
                Charge = (5 * 500) + (5 * 400) + ((Days - 10) * 200);
            }
        }

        public void display()
        {
            Console.WriteLine("Bike No \t PhoneNo \t No.of Days \t Charge");
            Console.WriteLine(BikeNumber + " \t " + PhoneNumber + " \t " + Days + "\t \t " + Charge);
        }


    }
    class Assignment
    {
        static void Main(string[] args)
        {
            int count;
            string message;
            List<Mobike> Rental_Bike = new List<Mobike>();
            Console.WriteLine("Enter How Many Customer Details You Want To Store");
            int num = int.Parse(Console.ReadLine());

            for (int i = 1; i <= num; i++)
            {
                Mobike obj = new Mobike();
                obj.Input(i);
                obj.Compute();
                Rental_Bike.Add(obj);
            }
            foreach (Mobike Re_Bike in Rental_Bike)
            {
                Re_Bike.display();
            }

            while (true)
            {
                Console.WriteLine("---------------------------------------------");
                Console.WriteLine("Press : \n\t 1.Add Another Customer Details \n\t 2.Delete Any Customer \n\t 3.Edit Customer Details \n\t 4.Search Customer Details");
                int Choice = int.Parse(Console.ReadLine());

                switch (Choice)
                {
                    case 1:
                        count = Rental_Bike.Count + 1;
                        Mobike add_cus = new Mobike();
                        add_cus.Input(count);
                        add_cus.Compute();
                        Rental_Bike.Add(add_cus);
                        Console.WriteLine("-----------Customer Details------------");
                        foreach (Mobike Re_Bike in Rental_Bike)
                        {
                            Re_Bike.display();
                        }
                        break;
                    case 2:
                        Console.WriteLine("Enter Customer Index Number That You Want To Delete");
                        int index_No = int.Parse(Console.ReadLine());
                        Rental_Bike.RemoveAt(index_No - 1);
                        Console.WriteLine("-----------Customer Details------------");
                        foreach (Mobike Re_Bike in Rental_Bike)
                        {
                            Re_Bike.display();
                        }
                        break;
                    case 3:
                        Console.WriteLine("Enter index number You Want Add New Customer in Previous List");
                        int index = int.Parse(Console.ReadLine());
                        count = Rental_Bike.Count + 1;
                        Mobike cus = new Mobike();
                        cus.Input(count);
                        cus.Compute();
                        Rental_Bike.Insert(index - 1, cus);
                        Console.WriteLine("-----------Customer Details------------");
                        foreach (Mobike Re_Bike in Rental_Bike)
                        {
                            Re_Bike.display();
                        }
                        break;
                    case 4:
                        Console.WriteLine("Enter Customer Index Number That You Want To Show Their Details");
                        int index_Show = int.Parse(Console.ReadLine());
                        Rental_Bike[index_Show - 1].display();
                        break;
                    default:
                        Console.WriteLine("Please Select Valid Option");
                        break;
                }
                Console.WriteLine("If You Want Exit Enter Yes Otherwise Press No");
                message = Console.ReadLine();
                if (message.ToLower() == "yes")
                {
                    break;
                }

            }
        }
    }
}
