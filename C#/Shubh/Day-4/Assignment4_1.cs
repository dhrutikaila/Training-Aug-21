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
    int age = -6;
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