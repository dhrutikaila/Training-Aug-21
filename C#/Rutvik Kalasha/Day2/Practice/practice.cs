using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PracticeDay2
{
    class Employee
    {
        //Property (Short way)
        public int Age { get; set; }

        //Property (Long way)
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
            Employee emp1 = new Employee();
            emp1.Age = 25;
            Console.WriteLine("Age of emp1 is {0}", emp1.Age);
            emp1.Name = "Hiren";
            Console.WriteLine("Name of emp1 is {0}", emp1.Name);
        }
    }
}