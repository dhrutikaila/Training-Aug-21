using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay4
{

    public class AgeException : Exception
    {
        public AgeException(String message)
            : base(message)
        {

        }
    }
    public class AssignmentDay4
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
                Console.WriteLine("Enter Your age: ");
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