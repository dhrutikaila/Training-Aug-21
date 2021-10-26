using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VoteData
{
    class Program
    {
        static void Main(string[] args)
        {
            //Accept Age from user, if age is more than 18 eligible for vote otherwise it should be displayed as not eligible. Do it with ternary operator
           
            Console.WriteLine("Enter age:");
            int age = Convert.ToInt32(Console.ReadLine());
            string result = (age > 18) ? "eligible for vote." : "Not eligible.";
            Console.WriteLine(result);
            Console.ReadLine();
        }
    }
}
