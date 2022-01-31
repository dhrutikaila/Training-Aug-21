using System;

namespace day_3
{

    public interface EMP {

        void Get();
        void Display();
        void Salary();
       
     
    }

    abstract class Employee:EMP
    {
        static int  id, pan;
        string name, address, er;

        public abstract void Salary();
        public  void Get() {

            id = Convert.ToInt32(Console.ReadLine());
            pan = Convert.ToInt32(Console.ReadLine());
            name = Console.ReadLine();
            address = Console.ReadLine();


        }
        public  void Display()
        {
            Console.WriteLine($"Employee name is salary is {name}");
            Console.WriteLine($"Employee id is salary is {id}");
            Console.WriteLine($"Employee pan is salary is {pan}");
            Console.WriteLine($"Employee address is salary is {address}");
        }
       
    }


    class Parttime:Employee
    {
        int total, noofhour,salperhour;

        public virtual void Get()
        {
            Console.WriteLine("enter no of hour");
            salperhour = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter salar per hour");
            noofhour = Convert.ToInt32(Console.ReadLine());

        }
        public override void Salary()
        {
            total = noofhour * salperhour;           
            Console.WriteLine($"salary per hour{total}");
        }
       
    }


    class Fulltime:Employee
    {
        int basic, hra, ta, da;

        public virtual void Get()
        {
            Console.WriteLine("enter hra");
            hra = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter ta");
            ta = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter da");
            da = Convert.ToInt32(Console.ReadLine());

        }
        public override void Salary()
        {

            basic= hra + ta + da;
            Console.WriteLine("salary of full time "+ basic);
        }
    }

    class Test {

        //public void invoke(EMP e)
        //{
        //    e.Get();
        //    e.Display();
        //}
        static void Main(string[] args)
        {
            Console.WriteLine("Hello there!");

            Employee ee = new Fulltime();
            ee.Get();
            ee.Display();
            
            

            

            //var t = new Test();
            //t.invoke(e);
            Fulltime ft = new Fulltime();
            ft.Get();
            ft.Salary();
            ft.Display();

            Parttime pt= new Parttime();
            pt.Get();
            pt.Salary();
            pt.Display();
        }

       
    }
}
