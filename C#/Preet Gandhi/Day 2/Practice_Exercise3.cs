//Properties

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice_Exercise3
{
    public class Person
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string FullName => $"{FirstName} {LastName}";

        static void Main(string[] args)
        {
            Person per = new Person();
            Console.WriteLine("Enter FirstName");
            var fName = Console.ReadLine();
            Console.WriteLine("Enter LastName");
            var lName = Console.ReadLine();
            per.FirstName = fName;
            per.LastName = lName;
            string fullname = per.FullName;
            Console.WriteLine("FullName is: {0}", fullname);
        }
    }
}
