using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Que3
{
    class Program
    {
        //Create a weekday enum and accept week day number and display week day.
        //enum is a special class for group of constant(which is read only)
        enum days{
            Sunday,
            Monday,
            Tuesday,
            Wednesday,
            Thursday,
            Friday,
            Saturday
        }
        static void Main(string[] args)
        {
            //Console.WriteLine();
            foreach(int i in Enum.GetValues(typeof(days)))
            {
                //get all the enum value 
                Console.Write($" {Enum.GetName(typeof(days),i)}");
                //for printing the number
                Console.WriteLine($" {i}");
            }
            Console.WriteLine("Please enter week day number which is between 0 to 6");
            int num = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("The weekday is " + $"{Enum.GetName(typeof(days), num)}");
            Console.ReadKey();
        }
    }
}
