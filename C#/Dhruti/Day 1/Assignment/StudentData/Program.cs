
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DemoConsoleApp
{
    class Program
    {


        static void Main(string[] args)
        {
            //task 3
            string[] arr = { "Name", "Address", "Hindi", "English", "Mathematics", "Grade" };

            Console.WriteLine("Enter student details as mentioned");
            string[,] name = new string[10, 2];

            int[,] marks = new int[10, 3];

            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine($"Enter student{i} Name : ");
                name[i, 0] = Console.ReadLine();

                Console.WriteLine($"Enter student{i} Address :");
                name[i, 1] = Console.ReadLine();

                Console.WriteLine($"Enter student{i} marks of Hindi English and Mathematics respectively :");

                marks[i, 0] = Convert.ToInt32(Console.ReadLine());
                marks[i, 1] = Convert.ToInt32(Console.ReadLine());
                marks[i, 2] = Convert.ToInt32(Console.ReadLine());

            }
            Console.WriteLine("------------------------------------------------------------\n");
            Console.WriteLine($"| {arr[0]}\t\t| {arr[1]}\t\t| {arr[2]}\t\t| {arr[3]}\t\t| {arr[4]}\t\t| {arr[5]}|\n");
            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine($"| {name[i, 0]}\t\t| {name[i, 1]}\t\t\t| {marks[i, 0]}\t\t| {marks[i, 1]}\t\t\t| {marks[i, 2]}\t\t\t| {(marks[i, 0] + marks[i, 1] + marks[i, 1]) / 3}|\n");
            }
            Console.WriteLine("------------------------------------------------------------\n");

            Console.ReadKey();

        }
    }
}




