
using System;

namespace extended2
{

    public class OldClass
    {
        public int x = 100;
        public void Test1()
        {
            Console.WriteLine("Method one: " + this.x);
        }
        public void Test2()
        {
            Console.WriteLine("Method two: " + this.x);
        }
    }

    public static class NewClass
    {
        public static string upper(this string a) {
            return a.ToUpper(); 
        }
        public static void Text3(this OldClass O)
        {
            Console.WriteLine("Method Three");
        }
        public static void Text4(this OldClass O, int x)
        {
            Console.WriteLine("Method Four: " + x);
        }
        public static void Text5(this OldClass O)
        {
            Console.WriteLine("Method Five:" + O.x);
        }
        public static void my(this OldClass p, int a, int b ) {

            int c = a + b;
            Console.WriteLine(c);
        }
    }
    public class Program
    {
        static void Main(string[] args)
        {
            string name = "hello"; 
            string str = name.upper();
            Console.WriteLine(str);

            OldClass obj = new OldClass();
            obj.Test1();
            obj.Test2();

            //Calling exrension methods
            obj.Text3();
            obj.Text4(10);
            obj.Text5();
            obj.my(3,5);

            Console.ReadLine();
        }
    }
}

