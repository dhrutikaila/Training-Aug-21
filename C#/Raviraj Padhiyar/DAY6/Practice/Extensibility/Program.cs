using System;
using System.Collections;
using System.Collections.Generic;

namespace DemoConsoleApp
{
    class Program
    {

        static void Main(string[] args)
        {
            Employee joe = new Employee("Raviraj","charadva","Morbi","Gujarat","363330");
            Console.WriteLine(joe.ToString());
            joe.Insurance = new InsuranceInfo() { PolicyName = "LIC", PolicyId = "123" };

            Console.ReadKey();
        }
    }
}
