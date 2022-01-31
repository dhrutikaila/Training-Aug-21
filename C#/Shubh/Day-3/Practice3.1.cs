using System;
using System.Collections.Generic;
using System.Text;

namespace Practice3_1
{

    public class Employee
    {
        public int salary = 48600;
    }

    public class Programmer : Employee
    {
        public float bonus = 6000;
    }
    class inheritance
    {
        public static void Main(string[] args)
        {
            Programmer p1 = new Programmer();

            Console.WriteLine("Salary is: " + p1.salary);
            Console.WriteLine("Bonus is: " + p1.bonus);

        }
    }
}
