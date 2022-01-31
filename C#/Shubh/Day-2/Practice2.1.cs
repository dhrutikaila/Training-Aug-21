using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice2_1
{
    class Employee
    {
        public int Age { get; set; }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Employee emp = new Employee();
            emp.Age = 29;
            Console.WriteLine("Age is: {0}", emp.Age);
            emp.Name = "Kanan";
            Console.WriteLine("Name is: {0}", emp.Name);
        }
    }
}