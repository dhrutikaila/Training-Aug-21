using System;

namespace examQ_1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("welcome to test!");

            Console.WriteLine("enter numbers of attempts");
            int attempt = Convert.ToInt32(Console.ReadLine());

            if (attempt == 1)
            {
                int marks = 0;
                Console.WriteLine("1.Apptitude\n 2.Math\n 3.GK\n 4.English\n 5.Exit\n");
                int choise1 = Convert.ToInt32(Console.ReadLine());

                if (choise1 == 1 || choise1 == 2 || choise1 == 3 || choise1 == 4)
                {
                    Console.WriteLine(" questions are as following:");

                    Console.WriteLine("Q1. choose appropriate answer\n 1.one 2.two 3.three 4.four");
                    int q1 = Convert.ToInt32(Console.ReadLine());
                    if (q1 == 1) { marks += 10; }
                    Console.WriteLine("Q2 choose appropriate answer.\n 1.one 2.two 3.three 4.four");
                    int q2 = Convert.ToInt32(Console.ReadLine());
                    if (q2 == 2) { marks += 10; }
                    Console.WriteLine("Q3.choose appropriate answer\n 1.one 2.two 3.three 4.four");
                    int q3 = Convert.ToInt32(Console.ReadLine());
                    if (q3 == 4) { marks += 10; }
                    Console.WriteLine("Q4.choose appropriate answer\n 1.one 2.two 3.three 4.four");
                    int q4 = Convert.ToInt32(Console.ReadLine());
                    if (q4 == 2) { marks += 10; }
                    Console.WriteLine("Q5.choose appropriate answer\n 1.one 2.two 3.three 4.four");
                    int q5 = Convert.ToInt32(Console.ReadLine());
                    if (q5 == 4) { marks += 10; }

                    if (marks < 10)
                    { marks += 2; }
                    else if (marks <= 30)
                    { marks += 5; }
                    else { marks += 10; }

                    Console.WriteLine("your total marks" + marks);
                    if (marks < 10 && marks > 0)
                    {
                        Console.WriteLine("Your IQ level is bellow average");
                    }
                    else if (marks >= 22) {
                        Console.WriteLine("Your IQ level is average");
                    }
                    else if (marks >= 30)
                    {
                        Console.WriteLine("Your intelligent");
                    }
                    else if (marks >= 40)
                    {
                        Console.WriteLine("Your Genius");
                    }
                }
                else if (choise1 == 5)
                {
                    Console.WriteLine("are you sure press \"Y\" for exit \"N\" for cancel");
                    string exit1 = Console.ReadLine();
                    if (exit1 == "Y")
                    {
                        Console.WriteLine("your total marks: " + marks);

                    }
                }

            }
            else {
                Console.WriteLine("test terminated..!");
            }



        }
    }
}
