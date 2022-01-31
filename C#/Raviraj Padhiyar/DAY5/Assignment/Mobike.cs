using System;

namespace DemoConsoleApp
{
    class Mobike
    {
        public int BikeNumber { get; set; }
        public string PhoneNumber { get; set; }
        public string Name { get; set; }
        public int Days { get; set; }
        public decimal Charge { get; set; }


        public void Input(int bikeNumber, string phoneNumber, string name,int days)
        {
            BikeNumber = bikeNumber;
            PhoneNumber = phoneNumber;
            Name = name;
            Days = days;
            Compute();
        }

        public void Compute()
        {
            int cost = 0;
            for (int i = 0; i < this.Days; i++)
            {
                if (i < 5)
                {
                    cost += 500;
                }
                else if (i < 10)
                {
                    cost += 400;
                }
                else
                {
                    cost += 200;
                }
            }

            Charge = cost;
        }

        public void Display()
        {
            Console.Write($"{BikeNumber}\t{PhoneNumber}\t{Days}\t{Charge}");
        }
    }
}