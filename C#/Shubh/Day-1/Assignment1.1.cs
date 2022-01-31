using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment1 //Assignment-1: Print sum of all the even numbers
{
    public class Program
    {
        static void Main(string[] args)
        {

            int i, num, sum = 0;

            // Reading number
            Console.Write("Enter any number: ");
            num = Convert.ToInt32(Console.ReadLine());

            for (i = 2; i <= num; i += 2)
            {
                //Adding current even number to sum variable
                sum += i;
            }
            Console.WriteLine("Sum of all even numbers between 1 to " + num + " is: " + sum);

            Console.ReadLine();
        }
    }
}
