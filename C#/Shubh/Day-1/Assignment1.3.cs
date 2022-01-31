using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment3  //Assignment-3: Create a weekday enum and accept week day number and display week day.
{
    class Assignment3
    {
        enum weekdays
        {
            Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
        };
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the WeekDay no. (Note: First day is Sunday & Index is 0): ");
            int userInput = int.Parse(Console.ReadLine());
            weekdays value = (weekdays)userInput;
            Console.WriteLine("WeekDay is: {0} ", value);
            Console.Read();
        }
    }
}
