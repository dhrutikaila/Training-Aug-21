using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/* Create a user defined exception class NameException which will validate a Name and name should contain only character. 
 * If name does not contain proper value it should throw an exception. You need to handle exception in student class.*/
namespace Assignment_2_Day4
{
    class NameException : Exception
    {
        public NameException()
        {
            Console.WriteLine("Name must be in proper format");
        }
    }
    class Student
    {
      public void validatename(string name)
        {
            char[] charArr = name.ToCharArray();
            for (int i = 0; i < charArr.Length; i++)
            {
                if (char.IsLetter(charArr[i]))
                {
                    Console.WriteLine("Valid name");
                }
               else if (char.IsDigit(charArr[i]))
                 {
                    throw new NameException();
                }
               
            }
        }
    }
  
    class Program
    {
        static void Main(string[] args)
        {
            Student s = new Student();
            Console.WriteLine("Enter studentname");
            string stuName = Console.ReadLine();
            try
            {
                s.validatename(stuName);
            }
            catch(NameException e)
            {
                Console.WriteLine(e.Message);
            }
            Console.ReadLine();

        }
    }
   
}
