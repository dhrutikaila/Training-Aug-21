using System;

namespace day_4
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello there!");

            student s = new student();
            try
            {
                s.show();
            }
            catch(AgeException e)
            {
                Console.WriteLine("!error: User defined exception: {0}", e.Message);
            }
            Console.ReadKey();
        }
    }

    class AgeException: Exception
    {
        public AgeException(string message): base(message) { }

    }

    class student {

        int age;

        

        public void show()
        {
            Console.WriteLine("enter age to check..");
            age = Convert.ToInt32(Console.ReadLine());

            if (age <= 0)
            {
                throw (new AgeException("age is not valid"));
            }
            else
            {
                Console.WriteLine("Age is valid");
            }

        }
    
    }
}
