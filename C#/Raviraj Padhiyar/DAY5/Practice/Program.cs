using System;
using System.Collections;
using System.Collections.Generic;

namespace DemoConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            //dynamic array
            //Arraylist
            ArrayList listname = new ArrayList();

            listname.Add(12);
            listname.Add("String");

            foreach (var ele in listname)
            {
                Console.WriteLine(ele);
            }
            Console.WriteLine(listname[0]);
            Console.WriteLine(listname.Count);

            //generice dynamice array

            List<int> new_list = new List<int>();

            new_list.Add(5);

            Console.WriteLine(new_list[0]);

            new_list.Add(3);
            new_list.Add(1);
            new_list.Add(2);
            new_list.Add(6);
            new_list.Add(9);
            new_list.Add(7);
            new_list.Add(4);

            
            new_list.ForEach(ele => Console.Write(ele + "\t"));
            Console.WriteLine();
            new_list.Sort();
            new_list.ForEach(ele => Console.Write(ele + "\t"));
            Console.WriteLine();

            //dictonary similar to paris in c++;

            Dictionary<string, int> names = new Dictionary<string, int>();

            names.Add("Raviraj", 21);
            names.Add("Rahil",20);
            names.Add("smit", 22);

            foreach (var ele in names)
            {
                Console.WriteLine($"{ele.Key}'s roll number is {ele.Value}");
            }


            if (names.ContainsKey("Raviraj")) Console.WriteLine("yes");
            else Console.WriteLine("no");

            //stack and queue

            Stack ngStack = new Stack();

            ngStack.Push("Raviraj");
            ngStack.Push(21);
            Console.WriteLine(ngStack.Pop());

            Stack<int> st = new Stack<int>();

            st.Push(32);
            //st.Push("raviraj"); throw error as its generic stack
            st.Push(21);

            Console.WriteLine(st.Pop());

            //queue

            Queue ng_queue = new Queue();
            Queue<int> qu = new Queue<int>();


            Console.ReadKey();
        }
    }
}
