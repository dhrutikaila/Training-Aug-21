using System;

namespace DelegateAppl
{

    class TestDelegate
    {
        delegate void dname(int name);
        delegate void second(int n1, int n2);

        delegate void third(string s);

        public void sum(int s)
        {
            Console.WriteLine(s);
        }
        public void fun2(int n1, int n2)
        {
            Console.WriteLine("fun 2 res" + n1 + n2);
        }
        public void fun3(int n1, int n2)
        {
            Console.WriteLine("fun 3 res" + n1 + n2);
        }



        public void fun4(string s)
        {
            //s = "aligator";
            Console.WriteLine("name is : {0}", s);
        }
        static void Main(string[] args)
        {
            //create delegate instances


            TestDelegate t = new TestDelegate();

            dname d = new dname(t.sum);
            second s = new second(t.fun2);
            third t2 = new third(t.fun4);


            s += t.fun3;
            s.Invoke(3, 5);

            t2("crocodile");



            d(5);

            Console.ReadKey();



            /*Geeks obj = new Geeks();
  
    // creating object of delegate, name as "del_obj1"
    // for method "sum" and "del_obj2" for method "subtract" &
    // pass the parameter as the two methods by class object "obj"
    // instantiating the delegates
    addnum del_obj1 = new addnum(obj.sum);
    subnum del_obj2 = new subnum(obj.subtract);
 
    // pass the values to the methods by delegate object
    del_obj1(100, 40);
    del_obj2(100, 60);*/
        }
    }
}
