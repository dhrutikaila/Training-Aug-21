using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Que2
{
    //Store your name in one string and find out how many vowel characters are there in your name.
    class Program
    {
        static void Main(string[] args)
        {
            //take the input from user 
            Console.WriteLine("Please enter your name :");
            string name = Console.ReadLine();
            int count = 0;

            for (int i =0; i< name.Length; i++)
            {
                //convert it into char
                char c = name[i];
                //if a , e , i ,o ,u is in char count will be increment by 1 
                if(c == 'a'|| c=='e'||c=='i'|| c == 'o'|| c == 'u')
                {
                    count++;
                }
            }
            //print the result 
            Console.WriteLine("No of vowels in " +name +" is "+count);
            Console.ReadLine();
        }
    }
}
