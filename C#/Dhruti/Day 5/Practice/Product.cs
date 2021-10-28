using System;
using System.Collections.Generic;

public class Program
{
	public static void Main()
	{
		IDictionary<int, string> numberNames = new Dictionary<int, string>();
		numberNames.Add(100, "tablet"); //adding key/value using the Add() method
		numberNames.Add(300, "leptop");
		numberNames.Add(200, "mobile");

		foreach (KeyValuePair<int, string> kvp in numberNames)
			Console.WriteLine("Key: {0}, Value: {1}", kvp.Key, kvp.Value);
		Console.ReadLine();
		if (!numberNames.ContainsKey(300))//check if key exists
		{
			numberNames[300] = "leptop";
		}

		string result;

		if (numberNames.TryGetValue(300, out result)) // try to get value of 4 key
			Console.WriteLine("Key: {0}, Value: {1}", 300, result);
		Console.ReadLine();

	}
}