using System;

namespace DemoConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Document doc = new Document();
            doc.Text = "Some Random text content like Lorem Ipsum Lorem Ipsum.";


            var blogPoster = new BlogPoster();
            var blogDelegete = new Document.SendDoc(blogPoster.PostBlog);
            doc.ReportSendingResult(blogDelegete);

            Console.ReadKey();
        }
    }
}
