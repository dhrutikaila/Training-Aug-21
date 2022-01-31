using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_6
{
    class Assignment6_1
    {
        //Method for reatangle area
        public static int recArea(int length, int width)
        {
            return length * width;
        }
        static void Main(string[] args)
        {
            //User Input
            Console.WriteLine("Length of rectangle is (l):");
            var Length = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Width of rectangle is (w):");
            var Width = Convert.ToInt32(Console.ReadLine());

            //Func Delegate
            Func<int, int, int> areaRec = recArea;
            Console.WriteLine("Area of rectangle using FuncDelegate is: " + areaRec(Length,Width));
        }
    }
}