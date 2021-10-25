//Implement all the oops concept for Employee payroll system.
//Create above class hierarchy, implement inheritance and polymorphism.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3
{

    interface IEmp
    {
        void Get();

        void Display();

        void Salary();
    }

    abstract class Employee:IEmp
    {
        int Id;
        string Name, Address,Pan_Number;

        public virtual void Salary() { }

        public virtual void Get()
        {
            Id = Id + 1;
            Console.WriteLine("Enter Employee Name :");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Employee Address :");
            Address = Console.ReadLine();
            Console.WriteLine("Enter Employee PanCard Number :");
            Pan_Number = Console.ReadLine();
        }

        public virtual void Display()
        {
            Console.WriteLine("Employee Name:" + Name + "\n Employee Address :"+Address+ "\n Employee PanCard Number :"+Pan_Number);            
        }
    }
    class PartTime : Employee
    {
        int NoOfHour, SalPerHour,Parttime_Salary;
        public override void Get()
        {
            base.Get();
            Console.WriteLine("Enter Employee Total Hours");
            NoOfHour = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter Employee Sal Per Hour");
            SalPerHour = int.Parse(Console.ReadLine());
        }
        public override void Salary()
        {
            Parttime_Salary = (NoOfHour * 50) + (SalPerHour * 50);
        }
        public override void Display()
        {
            Get();
            Salary();
            base.Display();
            Console.WriteLine("Employee Salary Is :"+ Parttime_Salary);
        }
    }
    class FullTime : Employee
    {
        int Basic, TA = 1000;
        float HRA, DA,Net_Salary,Gross_Salary;
        public override void Get()
        {
            base.Get();
            Console.WriteLine("Enter Employee Basic Salary");
            Basic = int.Parse(Console.ReadLine());             
        }
        public override void Salary()
        {
            HRA = Basic * 0.40f;
            DA = Basic * 0.30f;
            Gross_Salary = Basic + HRA + TA + DA;
            Net_Salary = Basic;
        }
        public override void Display()
        {
            Get();
            Salary();
            base.Display();            
            Console.WriteLine("Employee Net Salary Is :" + Net_Salary);
            Console.WriteLine("Employee Gross Salary Is :" + Gross_Salary);
        }
    }

    class Assignment
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter 1 For PartTime Employee || Enter 2 For FullTime Employee ");
            int Choice = int.Parse(Console.ReadLine());
            switch (Choice)
            {
                case 1:
                    PartTime PartTime_Emp = new PartTime();
                    PartTime_Emp.Display();
                    break;
                case 2:
                    FullTime FullTime_Emp = new FullTime();
                    FullTime_Emp.Display();
                    break;
                default:
                    Console.WriteLine("Invalid Choice");
                    break;
            }
            Console.ReadLine();

        }
    }
}
