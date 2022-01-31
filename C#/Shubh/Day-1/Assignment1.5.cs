using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment5  //Assignment-5: Accept Age from user, if age is more than 18 eligible for vote otherwise it should be displayed as not eligible. Do it with ternary operator
{
    class Program
    {
        static void Main(string[] args)
        {
            int age;
            Console.Write("Input the age of the candidate : ");
            age = Convert.ToInt32(Console.ReadLine());
            if (age < 18)
            {
                Console.Write("Sorry, You are not eligible to caste your vote.\n");
                Console.Write("You would be able to caste your vote after {0} year.\n", 18 - age);
                Console.ReadLine();
            }
            else
                Console.Write("Congratulation! You are eligible for casting your vote.");
                Console.ReadLine();
        }
    }
}
