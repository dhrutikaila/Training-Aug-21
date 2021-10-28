using System;
using System.Collections.Generic;

public class Class1
{
    public Class1()
    {
        Stack<string> age = new Stack<string>();
        age.Push("20");
        age.Push("21");
        age.Push("22");
        age.Push("23");
        age.Push("24");


        foreach (string number in age)
        {
            Console.WriteLine(number);
        }
        Console.WriteLine("/npopping '{0}'", age.Pop());
        Console.WriteLine("Peek at next item to destack: {0}", age.Peek());
        Console.WriteLine("/npopping '{0}'", age.Pop());
        Console.ReadLine();
        Stack<string> stack2 = new Stack<string>(age.ToArray());

        Console.WriteLine("\nContents of the first copy:");
        foreach (string number in stack2)
        {
            Console.WriteLine(number);
        }

        // Create an array twice the size of the stack and copy the
        // elements of the stack, starting at the middle of the
        // array.
        string[] array2 = new string[age.Count * 2];
        age.CopyTo(array2, age.Count);

        // Create a second stack, using the constructor that accepts an
        // IEnumerable(Of T).
        Stack<string> stack3 = new Stack<string>(array2);

        Console.WriteLine("\nContents of the second copy, with duplicates and nulls:");
        foreach (string number in stack3)
        {
            Console.WriteLine(number);
        }

        Console.WriteLine("\nstack2.Contains(\"four\") = {0}",
            stack2.Contains("four"));

        Console.WriteLine("\nstack2.Clear()");
        stack2.Clear();
        Console.WriteLine("\nstack2.Count = {0}", stack2.Count);
    }
}
    

