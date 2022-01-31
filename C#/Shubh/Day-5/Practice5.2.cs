using System;
using System.Collections.Generic;

public class Practice2
{
	public static void Main()
	{
		Stack<int> numbers = new Stack<int>();
		numbers.Push(18);
		numbers.Push(21);
		numbers.Push(56);
		numbers.Push(48);
		numbers.Push(6);

		foreach (var item in numbers)
			Console.Write("Age is: " + item + "\n");

	}
}
