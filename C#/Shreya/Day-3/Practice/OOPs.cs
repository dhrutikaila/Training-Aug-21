using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OopsPractice
{
    //inheritance,polymorphism example
    //is use for code reusability so time will be reduce and program is much readable 
    //does not support multiple class inheritance (for given class you have only one base class )
    public class Employee
    {
        public int empId;
        public string empName;
        public string designation;
         
        public  virtual void display()
        {
            Console.Write(empId +" "+ empName +" "+designation);
        }
    }
    //fulltimeemployee class can have access all the member of employee classs 
    public class FullTimeEmployee : Employee
    {
        public int yearlySalary;
        public int yearSalary()
        {
            Console.WriteLine(yearlySalary);
            return yearlySalary;
        }
        public override void display()
        {
            Console.WriteLine(empId + " " + empName + " " + designation + "-Full time employee");
        }
    }
    //parttimeemployee class can have access all the member of employee classs
    public class PartTimeEmployee : Employee
    {
        public int HalfSalary;
        public int HalfyearSalary()
        {
            Console.WriteLine(HalfSalary);
            return HalfSalary;
        }
        public override void display()
        {
            Console.WriteLine(empId + " " + empName + " " + designation + "-part time employee");
        }
    }
    //here we are trying to do multilevel inheritance 
    //So the class A have all the data member of class parttimeemployee and also employee classs so it is possible using multilevel inheritance 
    public class A : PartTimeEmployee
    {

    }
    class Program
    {
        static void Main(string[] args)
        {
            //trying to access employee class data and we are able to use that data bcz it is inherited from that class 
            FullTimeEmployee fy = new FullTimeEmployee();
            fy.empId = 101;
            fy.empName = "Shreya Thakkar";
            fy.designation = "Software developer";
            fy.yearlySalary = 30000;
            Console.WriteLine("Full time employee details are :");
            fy.display();
            fy.yearSalary();

            PartTimeEmployee py = new PartTimeEmployee();
            py.empId = 1001;
            py.empName = "Diya Thakkar";
            py.designation = "Software developer";
            py.HalfSalary = 14000;
            Console.WriteLine("Part time employee details are :");
            py.display();
            py.HalfyearSalary();
            
            Console.ReadKey();
        }
    }
}
