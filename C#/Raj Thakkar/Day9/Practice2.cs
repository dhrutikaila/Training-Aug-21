using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day9
{
    //Extension method
    public static class stringHelper
    {
        public static string ChangeFirstLetterCase(this string inputString)
        {
            if (inputString.Length > 0)
            {
                char[] charArray = inputString.ToCharArray();
                charArray[0] = char.IsUpper(charArray[0]) ? char.ToLower(charArray[0]) : char.ToUpper(charArray[0]);
                return new string(charArray);
            }
            return inputString;
        }
    }
    class Practice2
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter string");
            string strName = Console.ReadLine();
            string result = strName.ChangeFirstLetterCase();
            Console.WriteLine($"Answer is: {result}");
        }
    }
}
