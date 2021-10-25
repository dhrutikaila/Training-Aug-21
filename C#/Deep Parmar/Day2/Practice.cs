using System;

namespace Day2
{
    //public class Practice
    //{
    //    public static double DoOperation(double num1, double num2, string op)
    //    {
    //        double result = double.NaN; // Default value is "not-a-number" if an operation, such as division, could result in an error.

    //        // Use a switch statement to do the math.
    //        switch (op)
    //        {
    //            case "a":
    //                result = num1 + num2;
    //                break;
    //            case "s":
    //                result = num1 - num2;
    //                break;
    //            case "m":
    //                result = num1 * num2;
    //                break;
    //            case "d":
    //                // Ask the user to enter a non-zero divisor.
    //                if (num2 != 0)
    //                {
    //                    result = num1 / num2;
    //                }
    //                break;
    //            // Return text for an incorrect option entry.
    //            default:
    //                break;
    //        }
    //        return result;
    //    }
    //}

    /*class Person
    {
        public string Name  // property
        { get; set; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Person myObj = new Person();
            myObj.Name = "Liam";
            Console.WriteLine(myObj.Name);
        }
    }*/


    class Car
    {
        public string model;
        public string color;
        public int year;

        // Create a class constructor with multiple parameters
        public Car(string modelName, string modelColor, int modelYear)
        {
            model = modelName;
            color = modelColor;
            year = modelYear;
        }

        static void Main(string[] args)
        {
            Car Ford = new Car("Mustang", "Red", 1969);
            Console.WriteLine(Ford.color + " " + Ford.year + " " + Ford.model);
            Console.ReadLine();
        }
    }
}




