using System;

namespace DemoConsoleApp
{
    class Program
    {
        

        static void Main(string[] args)
        {
            Console.WriteLine("Enter your age please.");
            //Enter your age
            int age = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine((age > 18) ? "You are eligible for vote" : $"Your will be eligible for vote in {18 - age} years"); ;
            Console.ReadKey();

        }
    }
}
