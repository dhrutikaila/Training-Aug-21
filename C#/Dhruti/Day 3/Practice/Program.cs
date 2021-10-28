using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbtractPractice
{
    class Employee
    {
        int id;
        string Name;
        int basic, ta, da, gross, hra;
        double pf, net;

        void set()
        {
            Console.WriteLine("enter id");
            id = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter name");
            Name = Console.ReadLine();
            Console.WriteLine("enter basic salary");
            basic = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter hra");
            hra = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter ta");
            ta = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter da");
            da = Convert.ToInt32(Console.ReadLine());

        }

        void computegross()
        {
            gross = basic + hra + ta + da;
        }
        void PF()
        {
            pf = basic * .12;
        }
        void display()
        {
            Console.WriteLine($"id is{id} Name is{Name} basic salary is {basic} hra is{hra} ta is {ta} da is {da} net is {net} pf is {pf} gross is {gross}");
        }
        public void compute()
        {
            set();
            computegross();
            PF();
            net = gross - pf;
            display();
        }
    }
    class test
    {
        static void Main(string[] args)
        {
            Employee employee = new Employee();
            employee.compute();
            Console.ReadLine();
        }
    }

}


