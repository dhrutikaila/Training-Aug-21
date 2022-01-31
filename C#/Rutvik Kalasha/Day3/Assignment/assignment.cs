using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay3
{
    class Assignment
    {
    }

    interface IEMP
    {
        void Get();
        void Display();
        void Salary();
    }

    abstract class Employee : IEMP
    {
        protected int ID;
        protected string Name, Address, PanNumber;

        public virtual void Get()
        {
            Console.WriteLine("Enter Employee ID :");
            ID = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Employee Name :");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Employee PanNumber :");
            PanNumber = Console.ReadLine();
            Console.WriteLine("Enter Employee Address:");
            Address = Console.ReadLine();
        }

        public virtual void Display()
        {
            Console.WriteLine(ID);
            Console.WriteLine(Name);
            Console.WriteLine(PanNumber);
            Console.WriteLine(Address);
        }

        public abstract void Salary();

    }

    class PartTime : Employee
    {
        int NoOfHour,SalesPerHour;
        
        public override void Salary()
        {
            Console.WriteLine("Enter total numbre of hours :");
            NoOfHour = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter sales per hour :");
            SalesPerHour = Convert.ToInt32(Console.ReadLine());

            double PartTimeSalary = ((NoOfHour * 30) + (SalesPerHour * 10))*30;

            Console.WriteLine("Employee's PartTimeSalary is : " + PartTimeSalary);

        }
    }

    class FullTime : Employee
    {
        double Basic_Salary,Gross_Salary, HRA, TA, DA;

        public override void Get()
        {
            Console.WriteLine("Enter Employee ID :");
            ID = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Employee Name :");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Employee PanNumber :");
            PanNumber = Console.ReadLine();
            Console.WriteLine("Enter Employee Address:");
            Address = Console.ReadLine();
            Console.WriteLine("Enter Basic Salary :");
            Basic_Salary = Convert.ToInt32(Console.ReadLine());
        }

        public override void Salary()
        {
            DA = (Basic_Salary * 40) / 100;
            HRA = (Basic_Salary * 20) / 100;
            TA = (Basic_Salary * 20) / 100;
            Gross_Salary = Basic_Salary + DA + HRA + TA;

            if (Gross_Salary > 30000)
            {
                Gross_Salary = Gross_Salary - (Gross_Salary * 0.18);
            }

            Console.WriteLine("Employee's Gross Salary is : "+Gross_Salary);

        }

    }

    class Program
    {
        public void FuncionInvoke(IEMP emp)
        {
            if (emp.GetType().Name == "PartTime")
            {
                emp.Get();
                emp.Display();
                emp.Salary();
            }
            else
            {
                emp.Get();
                emp.Display();
                emp.Salary();
            }
            
        }

        static void Main(string[] args)
        {
            IEMP emp = null;

            Console.WriteLine("Enter 1 for PartTime Enter 2 for FullTime");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    emp = new PartTime();

                    break;
                case 2:
                    emp = new FullTime();
                    break;
                default:
                    Console.WriteLine("Invalid choice");
                    break;

            }
            var program = new Program();
            program.FuncionInvoke(emp);
            Console.ReadLine();
        }

    }
}