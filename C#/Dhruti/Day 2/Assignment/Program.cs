using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment2
{
    class Program
    {
        // private backing fields for properties
        string _firstname;
        string _lastname;
        string _email;
        DateTime _dateofbirth;

        public string firstname
        {
            get { return _firstname; }
            set { _firstname = value; }
        }

        public string lastname
        {
            get { return _lastname; }
            set { _lastname = value; }
        }

        public string email
        {
            get { return _email; }
            set
            {
                // make sure there's just one @ in it:
                string[] items = value.Split('@'); // split the string using @ as a separator
                if (items.Length != 2) // there should be exactly 2 items if it's valid
                {
                    throw new ArgumentException("Invalid email address");
                }
                _email = value; // otherwise it's OK to set it
            }
        }

        public DateTime dateofbirth
        {
            get { return _dateofbirth; }
            set
            {
                if (value > DateTime.Today) // if it's after today
                {
                    throw new ArgumentException("Date of birth can't be in the future");
                }
                _dateofbirth = value; // otherwise it's OK to set it
            }
        }

        public Program(string first, string last, string email, DateTime dateofbirth)
        {
            this.firstname = first;
            this.lastname = last;

            try
            {
                this.email = email;
            }
            catch (Exception ex)
            {
                Console.WriteLine();
                Console.WriteLine(ex.Message);
            }

            try
            {
                this.dateofbirth = dateofbirth;
            }
            catch (ArgumentException ex)
            {
                Console.WriteLine();
                Console.WriteLine(ex.Message);
            }
        }

        public bool Adult // readonly property has only a 'get'
        {
            get
            {
                DateTime eighteen = _dateofbirth.AddYears(18); // 18th birthday
                if (DateTime.Today >= eighteen) return true; // adult if 18 or over
                return false; // otherwise minor
            }
        }

        public bool birthday
        {
            get
            {
                DateTime today = DateTime.Today;
                if (today.Month == _dateofbirth.Month && today.Day == _dateofbirth.Day)
                {
                    return true;
                }
                return false;
            }
        }
    }

    // add this to make sure the class compiles OK 
    class Test
    {
        static void Main()
        {
            Console.WriteLine("Enter details for a Program\n");
            Console.Write(" First name : ");
            string first = Console.ReadLine();
            Console.Write(" Last name : ");
            string last = Console.ReadLine();
            Console.Write(" Email address : ");
            string email = Console.ReadLine();
            Console.Write(" Date of birth : ");
            string dob = Console.ReadLine();
            DateTime dateofbirth = DateTime.Parse(dob);
            Program p = new Program(first, last, email, dateofbirth);
            Console.WriteLine();
            Console.WriteLine("The Program entered is : {0} {1}", p.firstname, p.lastname);
            Console.WriteLine("Email address is: {0}", p.email);
            Console.WriteLine("Date of birth is: {0}", p.dateofbirth.ToShortDateString());
            Console.WriteLine("Adult : {0}", p.Adult);
            Console.WriteLine("Birthday today : {0}", p.birthday);
            Console.ReadKey();
        }
    }
}