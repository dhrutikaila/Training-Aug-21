using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    // Declare a delegate
    delegate void Del(int x, double y);

    class Delegates
    {
        static void Main(string[] args)
        {
            Delegates m = new Delegates();
            // Delegate instantiation using "MultiplyNumbers"

            Del d = m.MultiplyNumber;

            // Invoke the delegate object.
            Console.WriteLine("multiplication with delegates");
            for(int i = 1; i <= 5; i++)
            {
                d(i, 2);
            }
            
            Console.ReadLine();
        }

        // Declare the associated method.
         void MultiplyNumber(int m, double n)
        {
            Console.Write(m * n + "");
        }
    }

}