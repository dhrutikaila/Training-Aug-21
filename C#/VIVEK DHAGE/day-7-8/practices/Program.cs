
using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using day8_p2;

namespace day8_p2
{
    class file_2_p
    {
       /* public void create()
        {
            File.Create(@"F:\myfirst.txt");
            Console.WriteLine("created");
        }
       */
        public void copy()
        {
            File.Copy(@"F:\myfirst.txt",@"F:\copy\copied.txt");
            Console.WriteLine("copied");
        }

        public void move()
        {
            File.Move(@"F:\copy\copied.txt", @"F:\moved.txt");
            Console.WriteLine("moved");
        }
        public void delete()
        {
            File.Delete(@"F:\myfirst.txt");
            Console.WriteLine("Deleted");
        }


        public void finfo() {
            FileInfo f = new FileInfo(@"F:\copy\sample.txt");

            StreamWriter sw =  f.CreateText();
            sw.WriteLine("hello there");
            sw.Close();
        
        }

        public void finfo2()
        {
            FileInfo f = new FileInfo(@"F:\copy\sample.txt");

            if (f.Exists)
            {

                StreamReader sr = f.OpenText();
                string str = "";
                while ((str = sr.ReadLine()) != null)
                {
                    Console.WriteLine(str);
                }
                sr.Close();
            }
        }
        }
    }

    class program
    {

        public static void Main()
        {
        file_2_p p = new file_2_p();
        //p.create();
        //p.copy();
        //p.move();
        //p.delete();
        //p.finfo();
        p.finfo2();
    }
}


