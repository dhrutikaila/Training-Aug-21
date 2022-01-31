using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Exam
{
    interface species
    {
        void African();
        void Asian();
    }
    interface BodyCharacteristics
    {
        void Trunk();
        void Tusk();
        void Teeth();
        void skin();
        void legs();
        void Ears();

    }
    interface Diet
    {
        void Herbivores();
    }
    interface Reproduction
    {
        void Interval();
        void Weight();
    }
    interface Domestication
    {
        void Use();
    }
    class Elephant : species  , BodyCharacteristics , Diet , Reproduction , Domestication
    {
        public void African()
        {
            Console.WriteLine("Aftrican elephants are found in 38 countries of africa and they are 4 m tall their weight is 7000 kg");
        }
        public  void Asian()
        {
            Console.WriteLine("Asiana elephants are 3.4 m tall and their weights is 5400 kg ");
        }
       public  void Trunk()
        {
            Console.WriteLine("Trunk is used to tear up their food and place it in the mouth");
        }
        public  void Tusk()
        {
            Console.WriteLine("Tusk is used dig for water , salt , roots ");
        }
       public  void Teeth()
        {
            Console.WriteLine("Usually elephants have 28teeths");
        }
        public virtual void skin()
        {
            Console.WriteLine("The elephants's skin is extremly tough around most parts of the body it around 2.5 cm thick");

        }
        public virtual void legs()
        {
            Console.WriteLine("They have straight pillars ");
        }
       public virtual void Ears()
        {
           Console.WriteLine("Elephant's ear are made of a very thin layer of skin ");
        }
        public virtual void Herbivores()
        {
            Console.WriteLine("Elephants are Herbivores, spending 16 hours a day to collecting plant food");
        }
        public virtual void Interval()
        {
            Console.WriteLine("Female give birth at interval of every 5 years");
        }
       public virtual void Weight()
        {
            Console.WriteLine("At the time of giving birth their weight is around 90 to 115 kgs");
        }
        public virtual void Use()
        {
            Console.WriteLine("Elephants have been working animals used in various capacities by humans");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Elephant e = new Elephant();
            Console.WriteLine("-----------------------------------------------------------------------");
            Console.WriteLine('\t'+"  "+"Elephants Details");
            Console.WriteLine("-----------------------------------------------------------------------");
            e.African();
            e.Asian();
            e.Trunk();
            e.Tusk();
            e.Teeth();
            e.skin();
            e.legs();
            e.Ears();
            e.Herbivores();
            e.Interval();
            e.Weight();
            e.Use();
            Console.WriteLine("-----------------------------------------------------------------------");
            Console.ReadLine();
        }
    }
}
