using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Que5
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Your age : ");
            int age =Convert.ToInt32( Console.ReadLine());
            string res = (age < 18) ? "Not eligible for vote" : "Eligible for vote";
            Console.WriteLine(res);
            Console.ReadKey();

        }
    }
}
