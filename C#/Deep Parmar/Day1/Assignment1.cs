//Print sum of all the even numbers
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day1
{
    class Assignment1
    {
        static void Main(string[] args)
        {
            //Declare sum,count variable
            int sum = 0;
            int count = 0;

            Console.WriteLine("Enter Start And End Number in which You want Add the Even number between This Two number");
            Console.WriteLine("Enter The Starting Number");
            int Number1 = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter The Ending Number");
            int Number2 = int.Parse(Console.ReadLine());
            
            for (int i = Number1; i <= Number2; i++)
            {
                //Check Number is divisible by 2 or not
                if (i % 2 == 0)
                {
                    sum = sum + i;
                    count++;
                }
            }
            Console.WriteLine("Total Even Number Between {0}To {1} is {2}", Number1, Number2, count);
            Console.WriteLine("Sum of All Even Number Between {0}To {1} is {2}", Number1, Number2, sum);
            Console.ReadLine();
        }
    }
}
