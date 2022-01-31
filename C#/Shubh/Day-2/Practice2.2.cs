using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice2_2
{
    public class Empl
    {
        public string id;
        public string name;

        public Empl()
        {
        }

        public Empl(string name, string id)
        {
            this.name = name;
            this.id = id;
        }

        public static int employeeCounter;

        public static int AddEmployee()
        {
            return ++employeeCounter;
        }
    }

    class MainClass : Empl
    {
        static void Main()
        {
            Console.Write("Employee name: ");
            string name = Console.ReadLine();
            Console.Write("Employee Id: ");
            string id = Console.ReadLine();

            Empl e = new Empl(name, id);
            Console.Write("Enter no. of employees working: ");
            string n = Console.ReadLine();
            Empl.employeeCounter = Int32.Parse(n);
            Empl.AddEmployee();

            Console.WriteLine($"EmployeeName: {e.name}");
            Console.WriteLine($"EmployeeId:   {e.id}");
            Console.WriteLine($"Total Employees: {Empl.employeeCounter}");
        }
    }
}