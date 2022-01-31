using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_6
{
    class Practice6_1
    {
        static void Main(string[] args)
        {
            //Lambda 
            List<int> list = new List<int>() { 48, 6, 1, 9, 0, 58, 49 ,47 };
            List<int> evenNumbers = list.FindAll(x => (x % 2) == 0);

            Console.WriteLine("Even numbers are:");
            foreach (var num in evenNumbers)
            {
                Console.WriteLine("{0} ", num);
            }
            Console.WriteLine();
            Console.Read();
        }     
    }
}