//Implement all the oops concept for Employee payroll system.
//Create above class hierarchy, implement inheritance and polymorphism.
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_3
{
    interface IEmp
    {
        void Get();
        void Display();
        void Salary();
    }
    abstract class Employee : IEmp
    {
        static int Id;
        string Name, Address;
        protected int PanNumber;

        public virtual void Get()
        {
            Id += 1;
            Console.WriteLine("Enter Name");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Address");
            Address = Console.ReadLine();
            Console.WriteLine("Enter PanNumber");
            PanNumber = Convert.ToInt32(Console.ReadLine());
        }
        public virtual void Salary()
        {

        }
        public virtual void Display()
        {
            Console.WriteLine($"EmpId is {Id}, Name is {Name}, Address is {Address}, PanNumber is {PanNumber}");
        }

        
    }

    class PartTime : Employee 
    {
        int NoOfHours, SalPerHour, SalAmount;

        public override void Salary()
        {
            Console.WriteLine("Employee worked for how many hours?");
            NoOfHours = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Salary amount per hour");
            SalPerHour = Convert.ToInt32(Console.ReadLine());
            SalAmount = NoOfHours * SalPerHour;
            Console.WriteLine($"Your Salary is: {SalAmount}");

        }
    }

    class FullTime : Employee
    {
        int Basic, TA=1000;
        float HRA, DA , SalAmount;
        public override void Salary()
        {
            Console.WriteLine("Enter Basic Salary");
            Basic = Convert.ToInt32(Console.ReadLine());
            HRA = Basic * 0.40f;
            DA = Basic * 0.30f;
            SalAmount = Basic + HRA + TA + DA;
            Console.WriteLine($"Your Salary is: {SalAmount}");
        }
    }
    class Assignment1_Day3
    {
        public void FuncionInvoke(IEmp emp)
        {
            emp.Get();
            emp.Salary();
            emp.Display();
        }
        static void Main(string[] args)
        {
            IEmp emp = null;
            Console.WriteLine("Select 1 for Parttime job and 2 for Fulltime job");
            int userInput = Convert.ToInt32(Console.ReadLine());
            switch(userInput)
            {
                case 1:
                    emp = new PartTime();
                    break;
                case 2:
                    emp = new FullTime();
                    break;
                default:
                    Console.WriteLine("Invalid input");
                    break;
            }
            Assignment1_Day3 data = new Assignment1_Day3();
            data.FuncionInvoke(emp);
        }
    }
}
