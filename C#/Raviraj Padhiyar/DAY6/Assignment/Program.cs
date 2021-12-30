using System;


namespace DemoConsoleApp
{
    
    class Program
    {
        public delegate void RectDelegate(double height,
                                 double width);

        // "area" method
        public void Area(double height, double width)
        {
            Console.WriteLine("Area is: {0}", (width * height));
        }

        public static double RectArea(double height, double width)
        {
            return height * width;
        }
        

        

        static void Main(string[] args)
        {
            //Compute area of rectangle using func delegate
            Program rect = new Program();

            RectDelegate rectDele = new RectDelegate(rect.Area);

            rectDele.Invoke(6.3, 5.2);

            //Compute add of two number using lambda expression

            Func<double,double, double> area = (double height,double widtht) => (height * widtht);
            Console.WriteLine(area(6.3,5.2));

            Func<int, int, int> sum = (int num1, int num2) => (num1 + num2);

            Console.WriteLine(sum(2, 3));

            Console.ReadKey();
        }   
    }
}
