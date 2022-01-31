using System;

namespace DemoConsoleApp
{
    
    class Program
    {
        static void Main(string[] args)
        {
            var account = new BankAccount("Raviraj", 1000);

            account.MakeWithDrawal(500, DateTime.Now, "Rent Payment");
            Console.WriteLine(account.Balance);
            account.MakeDeposit(100, DateTime.Now, "Friend Payed me Back");
            Console.WriteLine(account.Balance);

            BankAccount invalidAccount;
            try
            {
                invalidAccount = new BankAccount("invalid", -55);
            }
            catch (ArgumentOutOfRangeException e)
            {
                Console.WriteLine("Exception caught creating account with negative value");
                Console.WriteLine(e.ToString());
            }

            try
            {
                account.MakeWithDrawal(700, DateTime.Now, "Attempt to overdraw");
            }
            catch(InvalidOperationException e)
            {
                Console.WriteLine("Exception caught trying to overdraw");
                Console.WriteLine(e.ToString());
            }

            Console.WriteLine(account.GetAccountHistory());

            Console.ReadKey();
        }
    }
}
