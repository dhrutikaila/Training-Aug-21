//Compute add of two number using lambda expression

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
            Console.WriteLine("Enter value1");
            var val1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter value2");
            var val2 = Convert.ToInt32(Console.ReadLine());

            //lambda expression
            calculate add = (x, y) => x + y;

            int result = add(val1, val2);
            Console.WriteLine($"Result: {val1} + {val2} = {result}");
        }
    }
}
