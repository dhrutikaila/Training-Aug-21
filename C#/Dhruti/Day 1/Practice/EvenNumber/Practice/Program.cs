using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvenNumber
{
    class Program
    {
        static void Main(string[] args)
        {
           Console.WriteLine("enter firstname:");

            //create a string variable and get user input from the keyboard and store it in the variable 
            string userName = Console.ReadLine();

            //print variable
            Console.WriteLine("firstname:" +userName);

            Console.WriteLine("enter age :");

            int age = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("your age is: " +age);
            Console.ReadLine();
        }
    }
}
