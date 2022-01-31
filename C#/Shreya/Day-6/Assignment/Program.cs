using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Day6Assignment
{
    public delegate int calculate(int l, int b);
    class Program
    {
        public static int area(int l , int b)
        {
            return l * b;
        }
        static void Main(string[] args)
        {
            Func<int, int , int> areaOfRectangle = area;
            Console.WriteLine("Area of rectangle is "+areaOfRectangle(10,10));
            Console.ReadLine();
        }
    }
}
