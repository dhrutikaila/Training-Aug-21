using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//C# Exam
namespace Day4
{


    class IqTest
    {
        static void Main(string[] args)
        {
            int score = 0, Bonus = 0;
            Console.WriteLine("Enter the number of attempts for this test you've taken");
            int attempts = int.Parse(Console.ReadLine());


            if (attempts > 1)
            {
                Console.WriteLine("You can not apply for the test");
                return;
            }
            else
            {
                for (int i = 0; i < 5; i++)
                {
                    Console.WriteLine("Enter the test number you want to apply for\n Aptitude\n English\n Math\n GK\n Exit");
                    int testNumber = int.Parse(Console.ReadLine());
                    switch (testNumber)
                    {
                        case 1:
                            Console.WriteLine("What is 99x98?\n 1. 9701\n 2. 9702\n 3. 9703\n 4. 9704");
                            int answer = int.Parse(Console.ReadLine());
                            if (answer == 2)
                            {
                                Console.WriteLine("Correct Answer");
                                score += 10;
                                break;
                            }
                            else
                            {
                                Console.WriteLine("Wrong Answer");
                                break;
                            }
                        case 2:
                            Console.WriteLine("What is I?\n 1. Personal Pronouns\n 2. Object Pronouns\n 3. Possessive pronouns\n 4. None of the above");
                            int answer1 = int.Parse(Console.ReadLine());
                            if (answer1 == 1)
                            {
                                Console.WriteLine("Correct Answer");
                                score += 10;
                                break;
                            }
                            else
                            {
                                Console.WriteLine("Wrong Answer");
                                break;
                            }
                        case 3:
                            Console.WriteLine("What is 16+4?\n 1. 19\n 2. 20\n 3. 21\n 4. 22");
                            int answer3 = int.Parse(Console.ReadLine());
                            if (answer3 == 2)
                            {
                                Console.WriteLine("Correct Answer");
                                score += 10;
                                break;
                            }
                            else
                            {
                                Console.WriteLine("Wrong Answer");
                                break;
                            }
                        case 4:
                            Console.WriteLine("Capital of India?\n 1. Mumbai\n 2. Pune\n 3. New Delhi\n 4. Patna");
                            int answer4 = int.Parse(Console.ReadLine());
                            if (answer4 == 3)
                            {
                                Console.WriteLine("Correct Answer");
                                score += 10;
                                break;
                            }
                            else
                            {
                                Console.WriteLine("Wrong Answer");
                                break;
                            }
                        case 5:
                            i += 6;
                            break;
                        default:
                            Console.WriteLine("Invalid Choice or Exit selected");
                            break;
                    }
                }
                if (score == 10)
                {
                    Console.WriteLine("Your IQ Level is below average");
                }
                else if (score == 20)
                {
                    Bonus += 2;
                    score += 2;
                    Console.WriteLine("Your IQ level is Average");
                }
                else if (score == 30)
                {
                    Bonus += 5;
                    score += 5;
                    Console.WriteLine("Your IQ level is Intelligent ");
                }
                else if (score == 40)
                {
                    Bonus += 10;
                    score += 10;
                    Console.WriteLine("Your are genius");
               0.
                        }
                else
                {
                    Console.WriteLine("You need to reappear the test");
                }

                Console.WriteLine("Bonus Points Earned:{0}", Bonus);
                Console.WriteLine("Score Points Earned:{0}", score);
                if (score == 10)
                {
                    Console.WriteLine("Your IQ Level is below average");
                }
                else if (score == 22)
                {

                    Console.WriteLine("Your IQ level is Average");
                }
                else if (score == 35)
                {

                    Console.WriteLine("Your IQ level is Intelligent ");
                }
                else if (score == 50)
                {

                    Console.WriteLine("Your are genius");
                }
                else
                {
                    Console.WriteLine("You need to reappear the test");
                }
                Console.ReadKey();
            }
        }
 +   }
}
