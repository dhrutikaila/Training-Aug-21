using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RentalsBikes
{
    class Mobike
    {
       public int BikeNumber; //to store the bike’s number

       public  int PhoneNumber; //to store the phone number of the customer

      public  string Name; // to store the name of the customer
                           // to store the number of days the bike is taken on rent o charge – to calculate and store the rental charge
        private DateTime days;
        public DateTime Days { get => days; set => days = value; }

        public void Input() {
            Console.WriteLine("enter Customer Name");
            
            
        }// to input and store the detail of the customer.

    public void Compute() { 
        
        
        } // to compute the rental charge

    public void display() {

            Console.WriteLine($" BikeNo   Cust_Name   PhoneNo    DaysOfRent ");
            Console.WriteLine($" {BikeNumber}   {Name}   {PhoneNumber}    {Days}");
        }// to display the details in the following format:
      

        class test
        {
            static void Main(string[] args)
            {
                var obj = new Mobike() { BikeNumber = 123, Name = "dhruti",PhoneNumber=123333333,};
                var obj1 = new Mobike() { BikeNumber = 123, Name = "Kashyap",PhoneNumber = 123333333,};
                var obj2 = new Mobike() { BikeNumber = 123, Name = "ravi", PhoneNumber = 123333333, };

                var arraylist = new ArrayList();
                arraylist.Add(obj);
                arraylist.Add(obj1);
                arraylist.Add(obj2);
                display(arraylist);
                Console.WriteLine("enter 1 for insert");
                Console.WriteLine("enter 2 for count");
                Console.WriteLine("enter 3 for serch available");
                int choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        var objdemo = new Mobike();
                        Console.WriteLine("enter bike_no");
                        objdemo.BikeNumber = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("enter Name");
                        objdemo.Name=Console.ReadLine();
                        Console.WriteLine("enter Phone_no");
                        objdemo.PhoneNumber = Convert.ToInt32(Console.ReadLine());
                        arraylist.Add(objdemo);
                        display(arraylist);
                        break;
                    case 2:
                        Console.WriteLine(arraylist.Count);
                        break;
                    case 3:
                        Console.WriteLine("enter Index number");
                        int idx = Convert.ToInt32(Console.ReadLine());
                        var objval = (Mobike)arraylist[idx];
                        objval.display();
                        break;

                }
                Console.ReadLine();
            }

            private static void display(ArrayList arraylist)
            {
                foreach ( var item in arraylist)
                {
                    if(item.GetType().Name == "objectDemo")
                    {
                        Mobike mobike = (Mobike)item;
                        mobike.display();
                    }
                    Console.WriteLine(item);
                }
            }
        }  
        
    }
}
