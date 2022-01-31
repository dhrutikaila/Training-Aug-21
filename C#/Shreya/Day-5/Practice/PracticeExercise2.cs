using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CollectionPractice
{
    // Create a stack which will store Age of person and display it last in first out order.
    class PracticeExercise2
    {
        static void Main(string[] args)
        {
            Stack<int> age = new Stack<int>();
            age.Push(12);
            age.Push(21);
            age.Push(22);
            age.Push(33);
            age.Push(31);
            age.Push(30);
            age.Push(23);
            foreach(int i in age)
            {
                Console.WriteLine("Person age : "+i );
               
            }
            Console.WriteLine("Peek element is "+ age.Peek());
            age.Pop();
            Console.WriteLine("After pop the element , Peek element is " + age.Peek());
            Console.ReadLine();
        }
    }
}
