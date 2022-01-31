using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/*Create a user defined Exception Class AgeException. If Age is less than 0 
 it should be thrown an exception. And you need to handle that exception in student class.
Note to create a user defined exception class you need to derive it from System.Exception class.
 */
namespace AssignmentDay_4
{
    class ValidateAge : Exception
    {
        public ValidateAge()
        {
            Console.WriteLine("Age must be greater than 0 ");
        }
    }
    class Program
    {
    
        static void Main(string[] args)
        {
            Console.WriteLine("Enter your age :");
            int age = Convert.ToInt32(Console.ReadLine());
            try
            {
                if (age <= 0)
                {
                    throw new ValidateAge();
                }
                else
                {
                    Console.WriteLine($"{age} valid age ");
                }
            }
            catch(ValidateAge e)
            {
                Console.WriteLine(e.Message );
            }
          

            Console.ReadLine();
        }
    }
}
