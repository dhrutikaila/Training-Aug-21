//Create a user defined Exception Class AgeException. If Age is less than 0 it should be thrown an exception. And you need to handle that exception in student class.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_4
{

    public class AgeException : Exception
    {
        public AgeException(String message)
            : base(message)
        {

        }
    }
    public class Assignment1_Day4
    {
        static void validate(int age)
        {
            if (age < 0)
            {
                throw new AgeException("Age must be greater than 0");
            }
        }
        static void Main(string[] args)
        {
            try
            {
                int age;
                Console.WriteLine("Enter Your age: (For exception enter negative value)");
                age = Convert.ToInt32(Console.ReadLine());
                validate(age);
                Console.WriteLine("You have entered correct value");
            }
            catch (AgeException e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
