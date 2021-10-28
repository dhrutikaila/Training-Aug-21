using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExceptionAss
{


    class AgeException : Exception
    {
        public AgeException()
        {
            Console.WriteLine("age must be greter than 0");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("enter age :");
            int age = Convert.ToInt32(Console.ReadLine());
            try
            {
                if (age <= 0)
                {
                    throw new AgeException();
                }
                else
                {
                    Console.WriteLine($"{age} valid age ");
                }
            }
            catch(AgeException e)
            {
                Console.WriteLine(e.Message );
            }
            Console.ReadLine();
        }
    }
}







