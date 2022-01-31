using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Print sum of all the even numbers//
namespace Day1
{
    class Assignment1
    {
        static void Main(string[] args)
        {
            int a = 0, sum = 0;
            Console.WriteLine("Give an even number");
            int b = Convert.ToInt32(Console.ReadLine());
            //Check if number is even
            if (b % 2 == 0)
            {
                for (a = 0; a <= b; a += 2)
                {
                    sum += a;
                }
                Console.WriteLine($"Sum of all even numbers is: " + sum);              
            }
            else
            {
                Console.WriteLine("The number you typed is not even");
            }
            Console.ReadKey();
        }
    }
}
