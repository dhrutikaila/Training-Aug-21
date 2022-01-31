using System;
using System.Collections.Generic;
using System.Text;

namespace Assignment3
{
    interface IEmp
    {
        void Get();
        void Display();
        void Salary();


    }
    abstract class Employee : IEmp
    {
        static int AccountID;
        string Name, Address,PanNumber;
        public virtual void Display()
        {
            Console.WriteLine($"\nEmployee's Account Id is {AccountID} , Name is {Name} , Address is {Address} , PAN is {PanNumber}");
        }

        public virtual void Get()
        {
            AccountID += 1;
            Console.WriteLine("\nEnter Name:");
            Name = Console.ReadLine();
            Console.WriteLine("\nEnter Address:");
            Address = Console.ReadLine();
            Console.WriteLine("\nEnter Pan Number:");
            PanNumber = Console.ReadLine();
        }

        public virtual void Salary()
        {
            //Console.WriteLine("working");
        }
    }
    class PartTime : Employee
    {
        int NoOfHour, SalePerHour;
        public override void Salary()
        {
            base.Salary();
            Console.WriteLine("\nEnter no of hours worked:");
            NoOfHour = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("\nEnter sales per hr:");
            SalePerHour = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine($"\nYour salary is {NoOfHour*SalePerHour*10}");

        }

    }
    class FullTime : Employee
    {
        int Basic, TA, HRA, DA;
        public override void Salary()
        {
            base.Salary();
            Console.WriteLine("\nEnter Basics");
            Basic = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("\nEnter TA");
            TA = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("\nEnter HRA");
            HRA = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("\nEnter DA");
            DA = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine($"\nYour salary is {Basic+TA+HRA+DA}");
        }
    }
    class Assignment
    {
        public void functioncall(IEmp obj)
        {
            obj.Get();
            obj.Salary();
            obj.Display();
        }
        static void Main(string[] args)
        {
            IEmp obj = null;
            Console.WriteLine("Select job type:\n---------------------------\n1 = Parttime job\n\n2 = Fulltime job\n");
            int input = Convert.ToInt32(Console.ReadLine());
            switch (input)
            {
                case 1:
                    obj = new PartTime();
                    break;
                case 2:
                    obj = new FullTime();
                    break;
                default:
                    Console.WriteLine("\nPlease select either 1 or 2");
                    break;
            }

            Assignment assign = new Assignment();
            assign.functioncall(obj);
        }
    }
}
