//Store your name in one string and find out how many vowel characters are there in your name.
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day1
{
    class Assignment2
    {
        public void Find_Vowel(string Name)
        {
            int count = 0;
            string Vowel = "";
            for (int i = 0; i < Name.Length; i++)
            {
                if (Name[i] == 'a' || Name[i] == 'e' || Name[i] == 'i' || Name[i] == 'o' || Name[i] == 'u')
                {
                    Vowel = Vowel + Name[i] + ",";
                    count++;
                }
            }
            Console.WriteLine("Total Vowel in {0} is : {1}", Name, count);
            Console.WriteLine("Vowel in {0} is : {1}", Name, Vowel);
        }
        static void Main(string[] args)
        {
            Assignment2 obj = new Assignment2();
            Console.WriteLine("Please Enter Your Name :");
            string Name = Console.ReadLine();
            obj.Find_Vowel(Name.ToLower());
            Console.ReadLine();
        }
    }
}
