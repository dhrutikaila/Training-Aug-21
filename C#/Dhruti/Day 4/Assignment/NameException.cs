using System;

namespace ExceptionAss
{
    class NameException : Exception
    {
        public NameException()
        {
            Console.WriteLine("Name must be proper format");
        }
    }
    class Student
    {
        public void Validatename(string name)
        {
            for (int i = 0; i < name.Length; i++)
            {
                if (char.IsDigit(Convert.ToChar(name)))
                {
                    throw new NameException();
                }
            }
        }
    }
}
