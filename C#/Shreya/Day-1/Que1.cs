using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Que1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Please enter number");
            //for user input
            int no = Convert.ToInt32(Console.ReadLine());
            int sum = 0;
            //till no 
            for(int i = 0; i <= no; i++)
            {
                //check wether the number is odd or even if even then do plus 
                if (i % 2 == 0)
                {
                    sum = sum + i;
                }
            }
            //print the sum of even number 
            Console.WriteLine("Sum of even number till "+no +" is "+ sum);
            Console.ReadLine();
        }
    }
}
