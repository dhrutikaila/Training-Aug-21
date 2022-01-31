using System;
using System.Collections.Generic;

class Practice3
{
    public static void Main()
    {
        Dictionary<string, int> dictionary = new Dictionary<string, int>();

        dictionary.Add("Football Shoes", 4860);
        dictionary.Add("Football", 5160);
        dictionary.Add("Football Jersey", 1920);
        dictionary.Add("Football Shorts", 1232);
        dictionary.Add("Football Shin-pads", 800);


        // See whether Dictionary contains this string.
        if (dictionary.ContainsKey("Football"))
        {
            int value = dictionary["Football"];
            Console.WriteLine("The price is ₹" + value);
        }
        else
        {
            Console.WriteLine("Key not found!");
        }
    }
}