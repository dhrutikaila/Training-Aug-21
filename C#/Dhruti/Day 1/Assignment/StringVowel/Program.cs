using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringVowel
{
    class Program
    {
        static void Main(string[] args)
        {
            //Store your name in one string and find out how many vowel characters are there in your name.
            string myStr;
            int i, len, vowel_count, cons_count;
            myStr = "DhrutiPatel";
            vowel_count = 0;
            cons_count = 0;
            //find length
            len = myStr.Length;
            for (i = 0; i < len; i++)
            {
                if (myStr[i] == 'a' || myStr[i] == 'e' || myStr[i] == 'i' || myStr[i] == 'o' || myStr[i] == 'u' || myStr[i] == 'A' || myStr[i] == 'E' || myStr[i] == 'I' || myStr[i] == 'O' || myStr[i] == 'U')
                {
                    vowel_count++;
                }
                else
                {
                    cons_count++;
                }
            }
            Console.WriteLine("\nvowels in the string :{0}\n", vowel_count);
            Console.ReadLine();
        }
    }
}
