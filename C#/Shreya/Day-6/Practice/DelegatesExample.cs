using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay_5
{
    //delegate signature is must be same as function signature 
    //in this example one delegate can point to the different method 
    //delegates points to parameterized and non parameterized method 
    //delegates has no body with the {}
    //we can use invoke method with delegate
    //delegates are used to encapsulate method 
    //delegates are objects that contain reference to methods that need to be invoked in stead of containing the actual method name 
    //delegates is like a general method name that point to various method at different time and invoke required method at run-time
    //invoking method at run time 

    public delegate void Calculate(int a, int b); 
    class DelegatesExample
    {
        public static void Addition(int a , int b)
        {
            int res = a + b;
            Console.WriteLine("Addition of two number is {0}",res);
        }
        public static void Subtraction(int a, int b)
        {
            int res = a - b;
            Console.WriteLine("Subtraction of two number is {0}", res);
        }
        public static void Multiplication(int a, int b)
        {
            int res = a * b;
            Console.WriteLine("Multiplication of two number is {0}", res);
        }
        public static void Division(int a, int b)
        {
            int res = a / b;
            Console.WriteLine("Division of two number is {0}", res);
        }
       

        static void Main(string[] args)
        {
            Calculate c = new Calculate(DelegatesExample.Addition);
            c.Invoke(12, 12);
            c = Subtraction;
            c(20, 10);
            c = Multiplication;
            c(21, 2);
            c = Division;
            c(30, 10);
            Console.ReadLine();
        }
    }
}
