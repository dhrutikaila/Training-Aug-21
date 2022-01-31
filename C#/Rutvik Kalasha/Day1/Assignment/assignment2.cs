using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentsDay1

{
	class Assignment2
	{
		static void Main(string[] args)
		{
			int totalvowels = 0;
			Console.WriteLine("Enter Name:");
			string name = Console.ReadLine();

			int nameLength = name.Length;
			for (int i = 0; i < nameLength; i++)
			{
				if (name[i] == 'A' || name[i] == 'E' || name[i] == 'I' || name[i] == 'O' || name[i] == 'U' || name[i] == 'a' || name[i] == 'e' || name[i] == 'i' || name[i] == 'o' || name[i] == 'u')
				{
					totalvowels++;
				}
			}
			Console.WriteLine("Total number of vowels is/are: " + totalvowels);
		}
	}
}