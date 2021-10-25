using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3
{
    class car
    {
        public virtual void gearbox()
        {
            Console.WriteLine("simple Gear Box");
        }
    }
    class sportsCar:car
    {
        public override void gearbox()
        {
            Console.WriteLine("Automatic gear box");
        }
    }

    //// Abstract class
    //abstract class Animal
    //{
    //    // Abstract method (does not have a body)
    //    public abstract void animalSound();
    //    // Regular method
    //    public void sleep()
    //    {
    //        Console.WriteLine("Zzz");
    //    }
    //}

    //// Derived class (inherit from Animal)
    //class Pig : Animal
    //{
    //    public override void animalSound()
    //    {
    //        // The body of animalSound() is provided here
    //        Console.WriteLine("The pig says: wee wee");
    //    }
    //}

    //// Interface
    //interface IAnimal
    //{
    //    void animalSound(); // interface method (does not have a body)
    //}


    //// Pig "implements" the IAnimal interface
    //class Pig : IAnimal
    //{
    //    public void animalSound()
    //    {
    //        // The body of animalSound() is provided here
    //        Console.WriteLine("The pig says: wee wee");
    //    }
    //}


    class Practice
    {
        static void Main(string[] args)
        {
            car obj1 = new sportsCar();
            obj1.gearbox();

            sportsCar car = new sportsCar();
            car.gearbox();

            //-------------------------------
            //Pig p = new Pig();
            //p.animalSound();
            //p.sleep();

            //-------------------------------
            //Pig obj = new Pig();
            //obj.animalSound();
            Console.ReadLine();
        }
    }
}
