using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment2 //Assignment-2: Store your name in one string and find out how many vowel characters are there in your name.
{
    class Program
    {
        static void Main(string[] args)
        {
            string myStr;
            int i, len, vowel_count, cons_count;

            myStr = "Shubh";

            vowel_count = 0;
            cons_count = 0;

            // find length
            len = myStr.Length;

            for (i = 0; i < len; i++)
            {
                if (myStr[i] == 'a' || myStr[i] == 'e' || myStr[i] == 'i' || myStr[i] == 'o' || myStr[i] == 'u' || myStr[i] == 'A'
                   || myStr[i] == 'E' || myStr[i] == 'I' || myStr[i] == 'O' || myStr[i] == 'U')
                {
                    vowel_count++;
                }
                else
                {
                    cons_count++;
                }
            }

            Console.Write("\nVowels in the string: {0}\n", vowel_count);
            Console.Write("\nConsonants in the string: {0}\n", cons_count);
            Console.ReadLine();
        }
    }
}
