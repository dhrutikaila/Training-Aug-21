using System;

namespace age
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Hello World!");

			int age;

			Console.WriteLine("enter age");
			age = Convert.ToInt32(Console.ReadLine());

			if (age < 18)
			{
				Console.WriteLine("sorry, you are not eligible");
			}
			else {
				Console.WriteLine("Congrats, you are eligible");
			}
		}
	}
}
