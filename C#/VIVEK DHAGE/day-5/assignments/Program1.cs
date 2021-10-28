using System;
using System.Collections.Generic;

namespace Day5_one
{
    class List_one
    {
        static void Main(string[] args)
        {

            List<string> names = new List<string>() { "vivek","saurabh","chirag","sumit","sagar"};
            //Console.Write(names[0]+" ,"); 
            //Console.Write(names[1] + ", "); 
            //Console.Write(names[2] + ", "); 
            //Console.Write(names[3] + ", ");


            names.ForEach(i => Console.WriteLine(i + ", "));

            // using for loop
            for (int i = 0; i < names.Count; i++)
                Console.WriteLine(names[i]);
        }
    }
}
