using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Accept Age from user, if age is more than 18 eligible for vote otherwise it should be displayed as not eligible. Do it with ternary operator//
namespace Day1
{
    class Assignment5
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter your age:");
            int age = Convert.ToInt32(Console.ReadLine());

            var result = age >= 18 ? "You are eligible for vote" : "You are not eligible";

            Console.WriteLine(result);
            Console.WriteLine("Enter Any Key To Close");
            Console.ReadKey();
        }
    }
}
