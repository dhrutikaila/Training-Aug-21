using System;

namespace extension_method1
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
        public static void my(this )
    }
    public class Program
    {
        static void Main(string[] args)
        {
            OldClass obj = new OldClass();
            obj.Test1();
            obj.Test2();

            //Calling exrension methods
            obj.Text3();
            obj.Text4(10);
            obj.Text5();

            Console.ReadLine();
        }
    }
}
