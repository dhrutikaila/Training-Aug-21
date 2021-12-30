using System;

namespace examQ_2
{
     interface Species {
         
        void African();
        void Asian();

    }
    interface Diet {
        
        void herbivores();
    }
    interface BodyCharacteristics {
        
        void trunk();
        void tusk();
        void teeth();
        void skin();
        void legs();
        void ears();
    }
    interface Reproduction {
        void interval();
        void weight();
    }
    interface Domestication {
        void use();
    }
    class Elephants : Species, Diet, BodyCharacteristics, Reproduction, Domestication {

        public void African() {
            Console.WriteLine("african elephants are found in 38 countries of africa and stand up to 4m and weight around 7000kg");
        }
       public  void Asian(){
            Console.WriteLine("asian elephants are 3.4m tall and weight 5,400kg");
        }

        public void herbivores(){
            Console.WriteLine("elephants are herbisover , spending 16 hours a day collection plant food");
        }

        public void trunk(){
            Console.WriteLine("trunk is used to tear up their food and then place it in their mouth");
        }
        public void tusk(){
            Console.WriteLine("used to dig for water salt, and roots to debark trees and branches when cleaning path");
        }
        public void teeth(){
            Console.WriteLine("they usually have 28 teeth ");
        }
        public void skin(){
            Console.WriteLine("it is an extremely rough around the most parts of its body and measure about 2.5cm thick");
        }
        public void legs(){
            Console.WriteLine("they are great straight pillars , as they must be to support their bulk weight");
        }
        public void ears(){
            Console.WriteLine("elephants ear are made of a very thin layer of skin stretched over  cartilage and a rich network of blood vessels");
        }

        public void interval(){
            Console.WriteLine("females gives birth at interval about every 5 years");
        }
        public void weight() {
            Console.WriteLine("at birth, calves weight around 90-115kg");
        }
        public void use(){
            Console.WriteLine("elephants have been working animals in various capacities by human");
        }
    } 
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello students!  .. the metaphora of elephants as bellow..");

            Elephants e1 = new Elephants();
            e1.African();
            e1.Asian();
            e1.trunk();
            e1.tusk();
            e1.teeth();
            e1.skin();
            e1.legs();
            e1.ears();
            e1.herbivores();
            e1.interval();
            e1.use();

            Console.ReadKey();

            
        }
    }
}
