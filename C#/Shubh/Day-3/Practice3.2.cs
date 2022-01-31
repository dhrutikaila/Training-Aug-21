using System;
using System.Collections.Generic;
using System.Text;

namespace Practice
{
    class Program
    {
        int EmpId;
        string EmpName;
        int EmpAge;

        public Program(int EmpId, string EmpName, int EmpAge)
        {
            this.EmpId = EmpId;
            this.EmpName = EmpName;
            this.EmpAge = EmpAge;
        }

        public int getId()
        {
            return this.EmpId;
        }

        public string getName()
        {
            return this.EmpName;
        }

        public int getAge()
        {
            return this.EmpAge;
        }


        static void Main(string[] args)
        {

           Program Leo = new Program(10, "Leo Messi", 34);
            Program Cristiano = new Program(7, "Critiano Ronaldo", 37);
            Console.WriteLine("Messi's age is {0}", Leo.getId());
            Console.WriteLine("Messi's age is {0}", Leo.getName());
           Console.WriteLine("Messi's age is {0}", Leo.getAge());
            Console.WriteLine("-------------------------------------");
            Console.WriteLine("Ronaldo's age is {0}", Cristiano.getId());
           Console.WriteLine("Ronaldo's age is {0}", Cristiano.getName());
            Console.WriteLine("Ronaldo's age is {0}", Cristiano.getAge());
            Console.WriteLine("-------------------------------------");
            Console.WriteLine(Leo.EmpId + Leo.EmpName);
            Console.WriteLine();
            Console.WriteLine(Cristiano.EmpId + Cristiano.EmpName);
            Console.ReadKey();
        }
    }
}
