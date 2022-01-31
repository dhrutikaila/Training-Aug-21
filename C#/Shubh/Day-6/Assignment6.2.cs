using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_6
{
    class Assignmen2_Day6
    {
        delegate int calculate(int x, int y);
        static void Main(string[] args)
        {
            //user input
            Console.WriteLine("Number 1: ");
            var val1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Number 2: ");
            var val2 = Convert.ToInt32(Console.ReadLine());

            //lambda expression
            calculate add = (x, y) => x + y;

            int result = add(val1, val2);
            Console.WriteLine($"Addition using lambda expr is: {val1} + {val2} = {result}");
        }
    }
}