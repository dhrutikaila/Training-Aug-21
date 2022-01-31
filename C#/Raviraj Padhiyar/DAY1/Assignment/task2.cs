using System;

namespace DemoConsoleApp
{
    class Program
    {

        
        static void Main(string[] args)
        {
            int countVowel = 0; //store count of vowel in variable

            Console.WriteLine("Enter your name please:");
            string name = Console.ReadLine();

            for(int i  = 0; i < name.Length; i++)
            {
                if(name[i] == 'a' || name[i] == 'e' || name[i] == 'i' || name[i] == 'o' || name[i] == 'u')
                {
                    countVowel++;
                }
            }

            Console.WriteLine(countVowel);
            Console.ReadKey();
        }
    }
}
