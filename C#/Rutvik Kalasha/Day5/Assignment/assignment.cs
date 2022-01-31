using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay5
{
    

    class Bikedetail
    {
        string Name;
        string BikeNumber;
        string PhoneNumber;
        int Days;
        int Charge;


        public void Input()
        {
            
            Console.WriteLine("Enter Name :");
            Name = Console.ReadLine();
            Console.WriteLine("Enter BikeNumber :");
            BikeNumber = Console.ReadLine();
            Console.WriteLine("Enter PhoneNumber :");
            PhoneNumber = Console.ReadLine();
            Console.WriteLine("Enter Days :");
            Days = Convert.ToInt32(Console.ReadLine());


        }

        public void Compute()
        {
            Charge = 0; 
            for(int i = 0; i <= Days; i++) {
                if (i <= 5)
                {
                    Charge = Days * 500;
                }
                else if (i>5 && i <= 10)
                {
                    Charge = Days * 400;
                }
                else
                {
                    Charge = Days * 200;
                }
            }
        }

        public void Display()
        {
            Console.WriteLine(Name + "\t" + BikeNumber + "\t" + PhoneNumber + "\t" + Days + "\t" + Charge + "\n");
        }
    }

    class AssignmentDay5
    {
        static void Displaylist(object o)
        {
            List<Bikedetail> bikedetaillist = (List<Bikedetail>)o;
            Console.WriteLine("Name | BikeNumber | PhoneNumber | Days | Charge\n");
            foreach(Bikedetail i in bikedetaillist)
            {
                i.Display();
            }
        }
        static void Main(string[] args)
        {
                            
            List<Bikedetail> bikedetaillist = new List<Bikedetail>();
            for (int i = 0; i < 2; i++)
            {
                Bikedetail m1 = new Bikedetail();
                m1.Input();
                m1.Compute();
                Bikedetail.Add(m1);
            }
            Displaylist(bikedetaillist);

            int exit = 1;
            while(exit == 1) {
                Console.WriteLine("Enter 1 For Add, 2 For Delete, 3 For Edit, 4 For Search : ");

                int op = Convert.ToInt32(Console.ReadLine());
                switch (op)
                {
                    case 1:
                        Bikedetail m = new Bikedetail();
                        m.Input();
                        m.Compute();
                        bikedetaillist.Add(m);
                        Console.WriteLine("Customer Added");
                        Displaylist(bikedetaillist);
                        break;
                    case 2:
                        Console.WriteLine("Enter Index You Want To Delete");
                        int deleteindex = Convert.ToInt32(Console.ReadLine());
                        if(deleteindex < bikedetaillist.Count)
                        {
                            bikedetaillist.RemoveAt(deleteindex);
                            Console.WriteLine("Customer Deleted");
                            Displaylist(bikedetaillist);
                        }
                        else
                        {
                            Console.WriteLine("Invalid Index");
                        }
                        break;
                    case 3:
                        Console.WriteLine("Enter index you want to edit");
                        int editindex = Convert.ToInt32(Console.ReadLine());
                        if(editindex < bikedetaillist.Count)
                        {
                            bikedetaillist[editindex].Input();
                            bikedetaillist[editindex].Compute();
                            Console.WriteLine("Customer Details Edited");
                            Displaylist(bikedetaillist);
                        }
                        else
                        {
                            Console.WriteLine("Invalid Index");
                        }
                        break;

                    case 4:
                        Console.WriteLine("Enter index you want to search");
                        int searchindex = Convert.ToInt32(Console.ReadLine());
                        if (searchindex < bikedetaillist.Count)
                        {
                            Console.WriteLine("Name | BikeNumber | PhoneNumber | Days | Charge\n");
                            bikedetaillist[searchindex].Display();
                        }
                        else
                        {
                            Console.WriteLine("Invalid Index");
                        }
                        break;
                    case 5:
                        exit = 0;
                        break;
                    default:
                        Console.WriteLine("Invalid Choice");
                        break;
                }
            }
            Console.ReadLine();
        }
    }
}