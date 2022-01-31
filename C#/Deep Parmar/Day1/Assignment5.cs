//Accept Age from user, if age is more than 18 eligible for vote otherwise it should be displayed as not eligible. Do it with ternary operator
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day1
{
    class Assignment5
    {
        static void Main(string[] args)
        {
            int Age;
            Console.WriteLine("Enter Your Age:");
            Age = int.Parse(Console.ReadLine());

            //Ternary operator use For age Check
            string result = (Age > 18) ? "You are eligible for vote" : "You are not eligible for vote";
            Console.WriteLine(result);
            Console.ReadLine();
        }
    }
}
