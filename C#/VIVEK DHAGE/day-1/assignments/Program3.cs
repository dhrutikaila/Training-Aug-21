using System;

namespace vowels
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Hello there..!");

			string str;
			int i, len, vowel;

			Console.WriteLine("input the string");
			str = Console.ReadLine();

			vowel = 0;
			len = str.Length;

			for (i = 0; i < len; i++)
			{
				if (str[i] == 'a' || str[i] == 'e' || str[i] == 'i' || str[i] == 'o' || str[i] == 'u' || str[i] == 'A' || str[i] == 'E' || str[i] == 'I' || str[i] == 'O' || str[i] == 'U')
				{
					vowel++;
				}

				

			}
			Console.WriteLine("total vowels are: " + vowel);
		}
	}
}
