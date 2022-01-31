using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_6
{
    class Practice_Exercise2
    {
        static void Main(string[] args)
        {
            //Lambda 
            List<int> list = new List<int>() { 1, 2, 3, 4, 5, 6 };
            List<int> evenNumbers = list.FindAll(x => (x % 2) == 0);

            Console.WriteLine("Even numbers:");
            foreach (var num in evenNumbers)
            {
                Console.WriteLine("{0} ", num);
            }
            Console.WriteLine();
            Console.Read();
        }     
    }
}
