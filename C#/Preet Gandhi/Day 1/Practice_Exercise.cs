//Do the hands on the things provided in videos and provided in the following url
//https://docs.microsoft.com/en-us/visualstudio/get-started/csharp/tutorial-console?view=vs-2019

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice_Exercise
{
	class Practice_Exercise
	{
		static void Main(string[] args)
		{

			//Calculator Exercise
			int num1 = 0, num2 = 0;
			Console.WriteLine("Console Calculator in C#");
			Console.WriteLine("------------------------\n");

			//User input "num1"
			Console.WriteLine("Type a Number and then press Enter key");
			num1 = Convert.ToInt32(Console.ReadLine());

			//User input "num2"
			Console.WriteLine("Type a Number and then press Enter key");
			num2 = Convert.ToInt32(Console.ReadLine());

			//Select Operator
			Console.WriteLine("Choose option from following list:");
			Console.WriteLine("\t'+' - Add");
			Console.WriteLine("\t'-' - Subtract");
			Console.WriteLine("\t'*' - Multiply");
			Console.WriteLine("\t'/' - Divide");
			Console.Write("Your Opinion?");

			//Switch statement to do operation
			switch (Console.ReadLine())
			{
				case "+":
					Console.WriteLine($"Your result: {num1} + {num2} = " + (num1 + num2));
					break;
				case "-":
					Console.WriteLine($"Your result: {num1} - {num2} = " + (num1 - num2));
					break;
				case "*":
					Console.WriteLine($"Your result: {num1} * {num2} = " + (num1 * num2));
					break;
				case "/":
					while (num2 == 0)
					{
						Console.WriteLine("Enter a non-zero divisor: ");
						num2 = Convert.ToInt32(Console.ReadLine());
					}
					Console.WriteLine($"Your result: {num1} / {num2} = " + (num1 / num2));
					break;
			}


			//Practice_Exercise2
			var myString = "Hello World";
			Console.WriteLine(myString);
			int myFirstValue = 80;
			double mySecondValue = 250.50;
			double sum = myFirstValue + mySecondValue;
			Console.WriteLine($"Value1 is {myFirstValue} and value2 is {mySecondValue}");
			Console.WriteLine("Sum is: " + sum.ToString());


			//Practice-Exercise3
			bool myFirstBoolean = 3 + 2 == 5;
			Console.WriteLine(myFirstBoolean.ToString());
			bool mySecondBoolean = 3 + 2 > 5;
			Console.WriteLine(mySecondBoolean.ToString());
			bool bothAreTrue = myFirstBoolean && mySecondBoolean;
			Console.WriteLine("bothAreTrue evalates: " + bothAreTrue);
			bool oneIsTrue = myFirstBoolean || mySecondBoolean;
			Console.WriteLine("oneIsTrue evalates {0} because one expressionis true", oneIsTrue);
			bool reverseMyFirstBoolean = !myFirstBoolean;
			Console.WriteLine("myFirstBoolean is {0} but reverseMyFirstBoolean is {1}", myFirstBoolean, reverseMyFirstBoolean);
		}
	}
}
