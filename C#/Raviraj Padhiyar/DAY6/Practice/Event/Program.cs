using System;

namespace DemoConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var theCLock = new Clock();
            var visibleClock = new VisibleClock();
            visibleClock.Subscribe(theCLock);
            theCLock.RunClock();

            var logger = new Logger();
            logger.Subscribe(theCLock);
            theCLock.RunClock();

            Console.ReadKey();
        }
    }
}
