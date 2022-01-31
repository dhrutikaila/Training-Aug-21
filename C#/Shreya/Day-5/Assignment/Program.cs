using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace AssignmentDay_5
{    
    class Mobike
    {
       public string BikeNumber { get; set; }
        public string PhoneNumber { get; set; }
        public string CustomerName { get; set; }
        public int days { get; set; }
        
       public double rent;
        public void input()
        {     
                Console.WriteLine("Enter Bike number");
                BikeNumber = Console.ReadLine();
                Console.WriteLine("Enter Phone number");
                PhoneNumber = Console.ReadLine();
                Console.WriteLine("Enter customer name");
                CustomerName = Console.ReadLine();
                Console.WriteLine("Enter days");
                days = Convert.ToInt32(Console.ReadLine());                           
        }
        public void compute()
        {   
            if (days >= 1 && days <= 5)
            {
                rent = days * 500;
            }
            else if (days >= 5 || days <= 10)
            {
                //int Firstslot = days - 5;
                rent = (days-5) * 400  + (5*500) ;
            }
            else
            {
                rent =((days-10) * 200) + (5 * 500) + (5 * 400);
            }
        }
        public void display()
        {           
            Console.WriteLine("=======================================================================");
            Console.WriteLine('\t'+"    "+"Customer Details");
            Console.WriteLine("=======================================================================");
            Console.WriteLine("Bike Number"+'\t' + "Customer name " + '\t' + "PhoneNo " +'\t'+ "No. of days"+'\t'+"Charge");         
            Console.WriteLine("-----------------------------------------------------------------------");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            List<Mobike> cusData = new List<Mobike>(10);
            Console.WriteLine("Enter number of customer which you want to add ::");
            int customer = Convert.ToInt32(Console.ReadLine());
            for (int i = 0; i < customer; i++)
            {
                Mobike mk = new Mobike();
                mk.input();
                mk.compute();              
                cusData.Add(mk);
            }
            Mobike mk1 = new Mobike();
            mk1.display();
            foreach (Mobike data in cusData)
            {
                Console.WriteLine(data.BikeNumber+'\t'+'\t'+data.CustomerName+'\t' + '\t' + data.PhoneNumber+'\t' + '\t' + data.days + '\t' + data.rent);
            }
            Console.WriteLine("-----------------------------------------------------------------------");
            Console.WriteLine("Enter 1 for add data");
            Console.WriteLine("Enter 2 for display the count");
            Console.WriteLine("Enter 3 for edit data");
            Console.WriteLine("Enter 4 for search data");
            int choice = Convert.ToInt32(Console.ReadLine());
            switch(choice)
            {
                case 1:
                    mk1.input();
                    mk1.compute();
                    cusData.Add(mk1);
                    mk1.display();
                    foreach (Mobike data in cusData)
                    {
                        Console.WriteLine(data.BikeNumber + '\t' + '\t' + data.CustomerName + '\t' + '\t' + data.PhoneNumber + '\t' + '\t' + data.days + '\t' + data.rent);
                    }
                    Console.WriteLine("-----------------------------------------------------------------------");
                    break;
                case 2:
                    Console.WriteLine("Total number of customer is "+ cusData.Count);                
                    break;
                case 3:
                    //cusData.RemoveAt(cusData.Count-1);
                 
                    break;
                default:
                    Console.WriteLine("Enter valid number");
                    break;
            }    
            Console.ReadLine();
        }
    }
}
