using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace EntityFramPractice
{
    class Program
    {
        public static void main()
        
        {
            var fileinfo = new FileInfo(@"Documents");
            Console.WriteLine(fileinfo.Exists);
            Console.WriteLine(fileinfo.LastAccessTime);

            FileStream fileStream = new FileStream(@"Documents", FileMode.Append, FileAccess.Write);
            StreamWriter stramwriter = new StreamWriter(fileStream);
            stramwriter.WriteLine("hii dhruti");
            stramwriter.Close();
        }
    }