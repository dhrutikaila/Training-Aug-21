using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Exam
{
    class Que
    {
        int marks;
        char ans;
        public void Apptitude()
        {
            Console.WriteLine("Que 1 : 2+2");
            Console.WriteLine("A : 4");
            Console.WriteLine("B : 10");
            Console.WriteLine("C : 8");
            Console.WriteLine("D : 0");
            Console.WriteLine("Please Enter Your ans");
            ans =Convert.ToChar(Console.ReadLine());
            if(ans == 'A')
            {
                marks = marks + 10;
            }
            else
            {
                Console.WriteLine("Incorrect ans!!");
            }
        }
        public void English()
        {
            Console.WriteLine("Que 1 : Find the correct Fruit name");
            Console.WriteLine("A : Sun");
            Console.WriteLine("B : Apple");
            Console.WriteLine("C : Moon");
            Console.WriteLine("D : Yellow");
            ans = Convert.ToChar(Console.ReadLine());
            if (ans == 'B')
            {
                marks = marks + 10;
            }
            else
            {
                Console.WriteLine("Incorrect ans!!");
            }
        }
        public void Maths()
        {
            Console.WriteLine("Que 1 : 2*10");
            Console.WriteLine("A : 4");
            Console.WriteLine("B : 10");
            Console.WriteLine("C : 20");
            Console.WriteLine("d : 0");
            ans = Convert.ToChar(Console.ReadLine());
            if (ans == 'C')
            {
                marks = marks + 10;
            }
            else
            {
                Console.WriteLine("Incorrect ans!!");
            }
        }
        public void GK()
        {
            Console.WriteLine("Que 1 : India's PM name is ...........");
            Console.WriteLine("A : Narendra modi");
            Console.WriteLine("B : APJ");
            Console.WriteLine("C : Vijay Rupani");
            Console.WriteLine("d : none of above ");
            ans = Convert.ToChar(Console.ReadLine());
            if (ans == 'A')
            {
                marks = marks + 10;
            }
            else
            {
                Console.WriteLine("Incorrect ans!!");
            }
        }
        public void Display()
        {
            Console.WriteLine("Your marks is "+marks);
            if (marks == 10)
            {
                Console.WriteLine("No bonus points");
            }
            else if (marks == 20)
            {
                Console.WriteLine("Bonus points are : 2");
            }
            else if (marks == 30)
            {
                Console.WriteLine("Bonus points are : 5");
            }
            else if (marks == 40)
            {
                Console.WriteLine("Bonus points are : 10");
            }
            else if (marks == 10)
            {
                Console.WriteLine("Your IQ level is below average ");
            }
            else if (marks == 22)
            {
                Console.WriteLine("Your IQ level is average ");
            }
            else if (marks == 35)
            {
                Console.WriteLine("Your IQ level is intelligent");
            }
            else if (marks == 40)
            {
                Console.WriteLine("You are genius");
            }
            else if (marks == 0)
            {
                Console.WriteLine("You need to  re appear the test");
            }
        }
    }
    class Exam2
    {
        static void Main(string[] args)
        {
            Que q = new Que(); 
            Console.WriteLine("Enter the number of attempts.....");
            int attempt = Convert.ToInt32(Console.ReadLine());
            if (attempt > 1)
            {
                Console.WriteLine("You don't appear for second time");
                return;
                //System.Environment.Exit(0);
            }
            else
            {
                Console.WriteLine("1.Apptitude");
                Console.WriteLine("2.English");
                Console.WriteLine("3.Maths");
                Console.WriteLine("4.GK");
                Console.WriteLine("5.Exit");
                Console.WriteLine("Enter Your choice .....");
                int choice = Convert.ToInt32(Console.ReadLine());
                int c1 = 0;
                int c2 = 0;
                int c3 = 0;
                int c4 = 0;
                while (choice != 5)
                {
                    switch (choice)
                    {

                        case 1:
                            if (c1 == 0)
                            {
                                c1++;
                                q.Apptitude();
                                //q.Display();
                                break;
                            }
                            else
                            {
                                Console.WriteLine("Already attempted");
                                break;
                            }
                        case 2:
                            if (c2 == 0)
                            {
                                c2++;
                                q.English();
                                break;
                            }
                            else
                            {
                                Console.WriteLine("Already attempted");
                                break;
                            }
                        case 3:
                            if (c3 == 0)
                            {
                                c3++;
                                q.Maths();
                                break;
                            }
                            else
                            {
                                Console.WriteLine("Already attempted");
                                break;
                            }
                        case 4:
                            if (c4 == 0)
                            {
                                c4++;
                                q.GK();
                                break;
                            }
                            else
                            {
                                Console.WriteLine("Already attempted");
                                break;
                            }
                        case 5:
                            Console.WriteLine("Thanks !");
                            break;
                        default:
                            Console.WriteLine("Invalid choice");
                            break;
                    }
                    Console.WriteLine("1.Apptitude");
                    Console.WriteLine("2.English");
                    Console.WriteLine("3.Maths");
                    Console.WriteLine("4.GK");
                    Console.WriteLine("5.Exit");
                    Console.WriteLine("Enter Your choice .....");
                    choice = Convert.ToInt32(Console.ReadLine());
                }
                q.Display();
            }
            Console.ReadLine();
        }
    }
}
