using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Store your name in one string and find out how many vowel characters are there in your name.//
namespace Day1
{
    class Assignment2
    {
        static void Main(string[] args)
        {
            int vowels = 0;
            Console.WriteLine("Enter your name:");
            string userName = Console.ReadLine();

            int name = userName.Length;
            for (int i = 0; i < name; i++)
            {
                if (userName[i] == 'A' || userName[i] == 'E' || userName[i] == 'I' || userName[i] == 'O' || userName[i] == 'U' || userName[i] == 'a' || userName[i] == 'e' || userName[i] == 'i' || userName[i] == 'o' || userName[i] == 'u')
                {
                    vowels++;
                }
            }
            Console.WriteLine("Total number of vowels are: " + vowels);
            Console.ReadKey();
        }
    }
}
