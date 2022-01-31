using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Create a weekday enum and accept week day number and display week day.//
namespace Day1
{
    class Assignment3
    {
        enum WeekDay
        {
            Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
        };
        static void Main(string[] args)
        {
            Console.WriteLine("Enter The WeekDay Number (0 = Sunday): ");
            int userInput = int.Parse(Console.ReadLine());
            WeekDay value = (WeekDay)userInput;
            Console.WriteLine("Week Day Is :{0}", value);
            Console.ReadKey();
        }
        
    }
}
