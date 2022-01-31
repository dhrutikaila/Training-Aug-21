//Do the hands on the things provided in video and url
//https://docs.microsoft.com/en-us/dotnet/csharp/tutorials/intro-to-csharp/object-oriented-programming

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_3
{
    public struct Person
    {
        public string Name;
        public int Age;
        public Person(string name, int age)
        {
            Name = name;
            Age = age;
        }
    }

    public class Application
    {
        static void Main()
        {
            // Create  struct instance and initialize by using "new".
            // Memory is allocated on thread stack.
            Person p1 = new Person("Alex", 9);
            Console.WriteLine("p1 Name = {0} Age = {1}", p1.Name, p1.Age);

            // Create  new struct object. Note that  struct can be initialized
            // without using "new".
            Person p2 = p1;

            // Assign values to p2 members.
            p2.Name = "Spencer";
            p2.Age = 7;
            Console.WriteLine("p2 Name = {0} Age = {1}", p2.Name, p2.Age);

            // p1 values remain unchanged because p2 is  copy.
            Console.WriteLine("p1 Name = {0} Age = {1}", p1.Name, p1.Age);
        }
    }
    public class equality
    {
        public static void EqualityTest()
        {
            //public struct Person
            //{
            //    public string Name;
            //    public int Age;
            //    public Person(string name, int age)
            //    {
            //        Name = name;
            //        Age = age;
            //    }
            //}

            Person p1 = new Person("Wallace", 75);
            Person p2 = new Person("", 42);
            p2.Name = "Wallace";
            p2.Age = 75;

            if (p2.Equals(p1))
            {
                Console.WriteLine("p2 and p1 have the same values.");
            }
                
        }
    }
}
    public class Person
    {
        public string Name { get; set; }
        public int Age { get; set; }
        public Person(string name, int age)
        {
            Name = name;
            Age = age;
        }
    }


class Practice_Exercise
    {
        static void Main()
        {
            Person person1 = new Person("Leopold", 6);
            Console.WriteLine("person1 Name = {0} Age = {1}", person1.Name, person1.Age);

            // Declare new person, assign person1 to it.
            Person person2 = person1;

            // Change the name of person2, and person1 also changes.
            person2.Name = "Molly";
            person2.Age = 16;

            Console.WriteLine("person2 Name = {0} Age = {1}", person2.Name, person2.Age);
            Console.WriteLine("person1 Name = {0} Age = {1}", person1.Name, person1.Age);
        }
    }

