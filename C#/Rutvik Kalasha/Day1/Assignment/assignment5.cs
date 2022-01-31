using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentsDay1
{
    class Assignment5
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter your age:");
            int age = Convert.ToInt32(Console.ReadLine());

            var result = age >= 18 ? "You are eligible to vote" : "You are not eligible";

            Console.WriteLine(result);
        }
    }
}
