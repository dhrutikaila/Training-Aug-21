using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice2_3
{
    public class Program
    {
        static void Main(string[] args)
        {
            var account = new BankAccount("Srp", 4806);
            Console.WriteLine($"Bank Account for {account.Owner} was created with Account No. {account.Number} & {account.Balance} initial balance.");

            account.MakeWithdrawal(500, DateTime.Now, "Debit");
            Console.WriteLine(account.Balance);
            account.MakeDeposit(100, DateTime.Now, "Credit");
            Console.WriteLine(account.Balance);

            Console.WriteLine(account.GetAccountHistory());

            BankAccount invalidAccount;
            try
            {
                invalidAccount = new BankAccount("invalid", -55);
            }
            catch (ArgumentOutOfRangeException e)
            {
                Console.WriteLine("Exception caught: A bank account can't have negative balance");
                Console.WriteLine(e.ToString());
                return;
            }

            try
            {
                account.MakeWithdrawal(750, DateTime.Now, "Attempt to overdraw");
            }
            catch (InvalidOperationException e)
            {
                Console.WriteLine("Exception caught: You can't withdraw more amount then the back balance");
                Console.WriteLine(e.ToString());
            }
        }
    }
}