//Compute area of rectangle using func delegate

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_6
{
    class Assignment1_Day6
    {
        //Method for reatangle area
        public static int recArea(int length, int width)
        {
            return length * width;
        }
        static void Main(string[] args)
        {
            //User Input
            Console.WriteLine("Enter length of rectangle:");
            var Length = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter width of rectangle:");
            var Width = Convert.ToInt32(Console.ReadLine());

            //Func Delegate
            Func<int, int, int> areaRec = recArea;
            Console.WriteLine("Area of rectangle is: " + areaRec(Length,Width));
        }
    }
}
