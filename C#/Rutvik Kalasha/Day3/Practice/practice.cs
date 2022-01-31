using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PracticeDay3
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
            // Memory is allocated on thread stack.
            Person p1 = new Person("Yash", 9);
            Console.WriteLine("p1 Name = {0} Age = {1}", p1.Name, p1.Age);

            // Create  new struct object. Note that  struct can be initialized
            Person p2 = p1;

            // Assign values p2 members.
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
            Person p1 = new Person("Nayan", 50);
            Person p2 = new Person("", 25);
            p2.Name = "Nayan";
            p2.Age = 50;

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


class PracticeExercise
    {
        static void Main()
        {
            Person person1 = new Person("Ankit", 6);
            Console.WriteLine("person1 Name = {0} Age = {1}", person1.Name, person1.Age);
            Person person2 = person1;
            person2.Name = "Rutvik";
            person2.Age = 16;

            Console.WriteLine("person2 Name = {0} Age = {1}", person2.Name, person2.Age);
            Console.WriteLine("person1 Name = {0} Age = {1}", person1.Name, person1.Age);
        }
    }