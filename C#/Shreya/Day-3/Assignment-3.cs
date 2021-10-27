
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_3
{
    //create interface which name is Emp
    interface Emp
    {
        void get();
        void Display();
        void Salary();

    }
    //create abstract class which is derived from Emp interface 
    abstract class Employee : Emp
    {
        static int EmpId;
        string EmpName, EmpAddress;
        protected string PanNumber;

        public virtual void get()
        {
            EmpId += 1; //empid is incremented by 1
            Console.WriteLine("Please Enter Employee Name ");
            EmpName = Console.ReadLine();
            Console.WriteLine("Please Enter Employee Address ");
            EmpAddress = Console.ReadLine();
            Console.WriteLine("Please Enter Employee Pan Card Number ");
            PanNumber = Console.ReadLine();
            
        }
        public virtual void Display()
        {
            Console.WriteLine($"Employee id is {EmpId} Employee Name is {EmpName} Employee Address is " +
                $"{EmpAddress} Employee Pan Card number is {PanNumber}");
        }
        public abstract void Salary();
       
    }
    class PartTimeEmployee : Employee
    {
        int NoOfHours, SalperHour,salary;
        public override void Salary()
        {
            Console.WriteLine("Enter Number of hours");
            NoOfHours = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Number of Sal per hours");
            SalperHour = Convert.ToInt32(Console.ReadLine());
        }
    }
    class FullTimeEmployee : Employee
    {
        int BasicSalary, HRA, TA, DA;
        double totalSalary;
        public override void Salary()
        {
            Console.WriteLine("Enter Basic Salary Of the employee");
            BasicSalary = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter HRA(House rent allowance) Of the employee");
            HRA = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Transport Allowance Of the employee");
            TA = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter DA(Dearness allowance) Of the employee");
            DA = Convert.ToInt32(Console.ReadLine());
            totalSalary = BasicSalary + HRA + TA + DA;
        }
        public override void Display()
        {
            base.Display();
            Console.WriteLine($"Total salary is {totalSalary}");
        }
    }
    class Program
    {
        public void FunctionInvoke(Emp e)
        {
            e.get();
            e.Salary();
            e.Display();
        }
        static void Main(string[] args)
        {
            Emp e = null;
            Console.WriteLine("Enter 1 Is for Full time Employee and enter 2 is for part time employee ");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    e  = new FullTimeEmployee();
                    break;
                case 2:
                    e = new PartTimeEmployee();
                    break;
                default: Console.WriteLine("Enter valid number");
                    break;

            }
            Program p = new Program();
            p.FunctionInvoke(e);
            Console.ReadLine();
        }
    }
}
