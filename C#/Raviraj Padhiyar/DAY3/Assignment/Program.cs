using System;

namespace DemoConsoleApp
{

    

    class Program
    { 
        public void employeeIntialize(IEmp emp)
        {
            if (emp.GetType().Name == "PartTime")
            {
                PartTime partTime = (PartTime)emp;
                partTime.CreateEmployee();
                emp.Salary();

            }
            else if(emp.GetType().Name == "FullTime")
            {
                FullTime fullTime = (FullTime)emp;
                fullTime.CreateEmployee();
                emp.Salary();
            }
        }
        static void Main(string[] args)
        {
            IEmp employee = null;
            Console.WriteLine("Enter 1 for part time and 2 full time employee");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch(choice)
            {
                case 1: employee = new PartTime();
                    break;
                case 2: employee = new FullTime();
                    break;
                default: Console.WriteLine("Invalid choice");
                    break;
            }

            var program = new Program();
            program.employeeIntialize(employee);
            Console.ReadLine();


        }
    }
}
