using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbtractPractice
{

    interface IEmp
    {
         void Display();

        // New implementation.

         void Salary();
         void Get();
        
    }
 
    abstract class Employee :IEmp
    {
       static int id;
        string Name,Address;
        int PanNumber;
            //fild declare
       public virtual void Get()
        {
            id += 1;
            Console.WriteLine("enter name");
            Name = Console.ReadLine();
            Console.WriteLine("enter address");
            Address = Console.ReadLine();//blank
            Console.WriteLine("enter pannumber");
            PanNumber = Convert.ToInt32(Console.ReadLine());
        }
        public virtual void Display()
        {
            Console.WriteLine($"id is {id} Name is {Name} Address is {Address} PanNumber is {PanNumber}");//display data
            Console.ReadLine();
        }
    
        public abstract void Salary();
    }
    class PartTime :Employee
    {

        int NoofHours, SalPerHour;
        public override void Salary()
        {
            Console.WriteLine("enter Number of Hours");
            NoofHours = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter Number sal per hour");
            SalPerHour = Convert.ToInt32(Console.ReadLine());
        }

    }
    class FullTime : Employee
    {
        
        
        int basic, ta, da, hra;
        double TotalSalary;

        public override void Salary()
        {
            Console.WriteLine("enter basic salary");
            basic = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter hra");
            hra = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter ta");
            ta = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter da");
            da = Convert.ToInt32(Console.ReadLine());
            TotalSalary = basic + hra + ta + da;
        }
        public override void Display()
        {
            base.Display();
            Console.WriteLine($"Total Salary Is {TotalSalary}");
        }
    }
    class test
    { 
        public void FunctionInvoke(IEmp e)
        {
            e.Get();
            e.Salary();
            e.Display();
        }
        static void Main(string[] args)
        {

            IEmp e = null;
            Console.WriteLine("enter 1 for FullTime and Enter 2 for PartTime");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch (choice)
            {
                case 1:
                    e = new FullTime();
                    break;
                case 2:
                    e = new PartTime();
                    break;
                default: Console.WriteLine("Enter Valid Data");
                    break;

            }
           
            test t = new test();
            t.FunctionInvoke(e);
            Console.ReadLine();
        }

      
    }

}
    

