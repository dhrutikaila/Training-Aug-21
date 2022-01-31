using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoConsoleApp
{
    class Employee
    {
        public string Name { get; set; }
        public AddressInfo Address { get; set; }
        public InsuranceInfo Insurance { get; set; }

        public Employee(string name, string street, string city, string state, string postalCode)
        {
            Name = name;
            Address = new AddressInfo()
            {
                Street = street,
                City = city,
                State = state,
                PostalCode = postalCode
            };
        }

        public override string ToString()
        {
            string retVal = Name + " " +
                Address.Street + " " +
                Address.City + " " +
                Address.State + " " +
                Address.PostalCode;

            if( Insurance != null)
            {
                retVal += " " +
                    Insurance.PolicyName + " " +
                    Insurance.PolicyId;
            }
            return retVal;
        }

    }
}
