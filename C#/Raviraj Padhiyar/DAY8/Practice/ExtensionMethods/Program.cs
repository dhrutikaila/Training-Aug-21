using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoConsoleApp
{
    static class Program
    {
        static bool ISGreaterThan(this int i, int value)
        {
            return i > value;
        }

        static void Main(string[] args)
        {
            int i = 10;

            bool result = i.ISGreaterThan(100);

            Console.WriteLine(result);
            Console.ReadKey();
        }
    }
}