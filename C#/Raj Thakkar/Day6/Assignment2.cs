using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Compute add of two number using lambda expression

namespace Day6
{
    class Assignment2
    {
        static void Main(string[] args)
        {
            Action<int, int> Add = (num1, num2) => {
                Console.WriteLine("Sum of {0} And {1} Is : {2}", num1, num2, (num1 + num2));
            };

            //Taking input From User
            Console.Write("Please Enter First Number : ");
            int Num1 = int.Parse(Console.ReadLine());
            Console.Write("Please Enter Second Number : ");
            int Num2 = int.Parse(Console.ReadLine());

            //Using Action Generic Delegate
            Add.Invoke(Num1, Num2);

            Console.ReadLine();
        }
    }
}
