using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay6
{
    class Assignment2
    {
        public static int recArea(int length, int width)
        {
            return length * width;
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Enter length of rectangle:");
            var Length = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter width of rectangle:");
            var Width = Convert.ToInt32(Console.ReadLine());

            Func<int, int, int> areaRec = recArea;
            Console.WriteLine("Area of rectangle is: " + areaRec(Length,Width));
        }
    }
}