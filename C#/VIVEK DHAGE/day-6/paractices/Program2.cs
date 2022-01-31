using System;

namespace day6_prac2
{
    public delegate string MyDel(string str);
    public delegate int mydel2(int a, int b);
    class EventProgram
    {

        event MyDel MyEvent;
        event mydel2 event1;



        public int sum(int a, int b)
        {
            return a + b;
            //Console.WriteLine(a+b);
        }
        public string WelcomeUser(string username)
        {
            return "Welcome " + username;
        }

        // function for adding events
        public EventProgram()
        {
            this.MyEvent += new MyDel(this.WelcomeUser);
            this.event1 += new mydel2(this.sum);
        }
        static void Main(string[] args)
        {
            EventProgram obj1 = new EventProgram();
            string result = obj1.MyEvent("welcome here...!! ");
            Console.WriteLine(result);

            var mysum = obj1.event1(2, 3);
            Console.WriteLine("the sum is :{0}", mysum);
        }
    }
}