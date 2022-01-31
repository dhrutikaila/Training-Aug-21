using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Compute area of rectangle using func delegate

namespace Day6
{
    class Assignment1
    {
        static void Main(string[] args)
        {
            Func<int, int, int> Area = (Length, Width) => Length * Width;

            //Taking Lenght And Width Of Rectangle from user
            Console.Write("Enter Rectangle Length : ");
            int Rec_Length = int.Parse(Console.ReadLine());
            Console.Write("Enter Rectangle Width : ");
            int Rec_Width = int.Parse(Console.ReadLine());

            //Use Area Func Delegate
            int Result = Area(Rec_Length, Rec_Width);
            Console.WriteLine("Area Of Rectagle Is : {0}", Result);

            Console.ReadLine();
        }
    }
}
