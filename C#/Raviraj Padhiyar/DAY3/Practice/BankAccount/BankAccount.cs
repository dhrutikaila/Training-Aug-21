using System;
using System.Collections.Generic;


namespace DemoConsoleApp
{
    class BankAccount
    {
        private static int accountNumberseed = 1234567890;

        private List<Transaction> allTransaction = new List<Transaction>();
        public string Number { get; }
        public string Owner { get; set; }

        public readonly decimal minimumBalance;

        public BankAccount(string name,decimal initialBalance) : htis

        
        public decimal Balance
        {
            get
            {
                decimal balance = 0;
                foreach (var item in allTransaction)
                {
                    balance += item.Amount;
                }
                return balance;
            }
        }

        public BankAccount(string name, decimal initialbalance)
        {
            this.Owner = name;

            this.Number = accountNumberseed.ToString();
            accountNumberseed++;

            MakeDeposit(initialbalance, DateTime.Now, "Initial balance");
        }

        public void MakeDeposit(decimal amount, DateTime date, string note)
        {
            if (amount <= 0)
            {
                throw new ArgumentOutOfRangeException(nameof(amount), "Amount of deposit must be positive");
            }
            var deposit = new Transaction(amount, date, note);
            allTransaction.Add(deposit);
        }

        public void MakeWithDrawal(decimal amount, DateTime date, string note)
        {
            if (amount <= 0)
            {
                throw new ArgumentOutOfRangeException(nameof(amount), "Amount of withdrawal must be positive");
            }
            if (Balance - amount < 0)
            {
                throw new InvalidOperationException("Not sufficeient Funds for this withdrawal");
            }
            var withdrawal = new Transaction(-amount, date, note);
            allTransaction.Add(withdrawal);
        }

        public string GetAccountHistory()
        {
            var report = new System.Text.StringBuilder();

            decimal balance = 0;
            report.AppendLine("Date\t\tAmount\tBalance\tNote");
            foreach (var item in allTransaction)
            {
                balance += item.Amount;
                report.AppendLine($"{item.Date.ToShortDateString()}\t{item.Amount}\t{balance}\t{item.Notes}");
            }

            return report.ToString();
        }

        public virtual void PerformMonthEndTransactions() { }


    }

    class InterestEarningAccount : BankAccount
    {
        public InterestEarningAccount(string name,decimal intialbalance) : base(name,intialbalance)
        {

        }

        public override void PerformMonthEndTransactions()
        {
            if(Balance > 500m)
            {
                var interest = Balance * 0.05m;
                MakeDeposit(interest, DateTime.Now, "apply monthly interest");
            }
        }


    }

    class LineOfCreditAccount : BankAccount
    {
        
        public LineOfCreditAccount(string name, decimal initialBalance) : base(name, initialBalance)
        {
        }
        public override void PerformMonthEndTransactions()
        {
            var interest = -Balance * 0.07m;
            MakeWithDrawal(interest, DateTime.Now, "charge monthly interest");
        }
    }

    class GiftCardAccount : BankAccount
    {
        
        private decimal _monthlyDeposit = 0m;

        public GiftCardAccount(string name, decimal initialBalance, decimal monthlyDeposit = 0) : base(name, initialBalance)
            => _monthlyDeposit = monthlyDeposit;

        public override void PerformMonthEndTransactions()
        {
            if (_monthlyDeposit != 0)
            {
                MakeDeposit(_monthlyDeposit, DateTime.Now, "Add monthly deposit");
            }
        }


    }




    
}
