using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_5
{
    class Practice_Exercise2
    {
        static void Main(string[] args)
        {
            var age = new Stack<int>();

            Console.WriteLine("Enter age of 5 persons:");
            for (int i = 0; i < 5; i++)
            {
                int personAge = Convert.ToInt32(Console.ReadLine());
                age.Push(personAge);
            }

            Console.WriteLine("Different ages are given below:");
            foreach (int i in age)
            {
                Console.WriteLine($"{i}");
            }
        }
    }
}