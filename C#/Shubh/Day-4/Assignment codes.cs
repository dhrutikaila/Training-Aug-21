//Assignment-1: Create a user defined Exception Class AgeException. If Age is less than 0 it should be thrown an exception. And you need to handle that exception in student class.


using System;
namespace Assignment4_1
{
    class Student
    {
        static void Main(string[] args)
        {
            Age a = new Age();
            try
            {
                a.displayAge();
            }
            catch (AgeException e)
            {
                Console.WriteLine("Exception Occured: {0}", e.Message);
            }
            Console.ReadLine();
        }
    }
}
public class AgeException : Exception
{
    public AgeException(string message) : base(message)
    {
    }
}
public class Age
{
    int age =5;
    public void displayAge()
    {
        if (age < 0)
        {
            throw (new AgeException("Age cannot be negative"));
        }
        else
        {
            Console.WriteLine("Age is: {0}", age);
        }
        Console.ReadLine();
    }
}

//Assignment-2: Create a user defined exception class NameException which will validate a Name and name should contain only character. If name does not contain proper value it should throw an exception. You need to handle exception in student class.



