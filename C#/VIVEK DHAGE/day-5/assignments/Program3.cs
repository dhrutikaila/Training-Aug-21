using System;
using System.Collections;

namespace day5_two
{
    class stak
    {
        int age;
        Stack stk = new Stack();
       
        public void fun()
        {
            Console.WriteLine(" enter age 5 times");
            for (int i=0;i<=5;i++) {
                age = Convert.ToInt32(Console.ReadLine());
                stk.Push(age);
            }

        }

        public void display()
        {
            foreach (var elem in stk)
            {
                Console.WriteLine(elem);
            }
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello there!");

            stak s1 = new stak();
            s1.fun();

            Console.WriteLine("your stack data as : -");
            s1.display();

            Console.ReadKey();
        }
    }
}
