using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvenNum
{
    class Program
    {
        static void Main(string[] args)
        {
            //print sum of number
            int i, num, sum = 0;
            Console.WriteLine("enter any number: ");
            num = Convert.ToInt32(Console.ReadLine());

            for (i = 2; i <= num; i += 2)
            {
                sum += i;
            }
            Console.WriteLine("sum of all even number between 1 to " + num + "=" + sum);
            Console.ReadLine();

        }
    }
}
