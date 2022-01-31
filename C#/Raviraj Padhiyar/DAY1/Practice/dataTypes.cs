using System;

namespace DemoConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            //declaring character
            char a = 'R';

            

            //Numeric data types
            //int data type

            //declaring 32-bit int
            int i = 456;

            //declaring 16-bit int
            short s = 32767;

            //declaring 64-bit int
            long l = 1000000;

            //unsigned int
            uint ui = 234;
            ushort us = 43;
            ulong ul = 123238;

            //floating points
            //32bit fp precision of 7 digit;
            float f = 2.34343f;

            //64bit fp precision of 14 digit
            double d = 2.7347328393;

            //128bit fp decimal precision of 27-28 bit;
            decimal dc = 2.12781723871236812782m;
            //have to use m at end for specifying its is an decimal

            //other data type
            //sbyte 8-bit int store value of -128 to 127
            //byte 8-bit int store value of 0 to 256 unsigned by defulat

            byte by = 252;
            sbyte sb = 127;

            //boolean value
            bool isFalse = true;


            //print all data types

            Console.WriteLine("char\t" + a);
            Console.WriteLine("int\t" + i);
            Console.WriteLine("short\t" + s);
            Console.WriteLine("long\t" + l);
            Console.WriteLine("unsinged int \t" + ui);
            Console.WriteLine("unsinged short \t" + us);
            Console.WriteLine("unsinged long \t" + ul);
            Console.WriteLine("float\t" + f);
            Console.WriteLine("double\t" + d);
            Console.WriteLine("decimal\t" + dc);
            Console.WriteLine("byte\t" + by);
            Console.WriteLine("sbyte\t" + sb);
            Console.WriteLine("boolean\t" + isFalse);

            //Refrence data type

            //refrence data types sotred address of the value

            //string
            //declaring string
            string str = "hello";

            Console.WriteLine("string\t" + str);
            
            //object 
            // all data types types are somehow inherited from object data type

            //When a variable of a value type is converted to object
            //it's called boxing


            //When a variable of type object is converted to a value type
            //it's called unboxing

            //declaring object
            Object obj;
            obj = 20; //unboxing as obj variable is converted to value type

            Console.WriteLine(obj.GetType());


            //unsafe
            //{
            //    //pointer data types
            //    int n = 20;

            //    int* p = &n;
            //    Console.WriteLine("Value :{0}", n);
            //    Console.WriteLine("address :{0}", (int)p);

            //}

            Console.ReadKey();

        }
    }
}
