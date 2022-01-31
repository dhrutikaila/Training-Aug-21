using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssignmentDay7_8
{
    public class Employee
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public double Salary { get; set; }
        public DateTime JoiningDate { get; set; }
        public string Deparment { get; set; }
    }
    public class Incentive
    {
        public int ID { get; set; }
        public double IncentiveAmount { get; set; }
        public DateTime IncentiveDate { get; set; }
    }
    class Assignment
    {
        static void Main(string[] args)
        {
            List<Employee> employees = new List<Employee>()
            {
                new Employee(){ID=1,FirstName="Rutvik",LastName="Kalasha",Salary=1000000,JoiningDate=new DateTime(2015,12,12),Deparment="Dotnet"},
                new Employee(){ID=2,FirstName="Akash",LastName="Patel",Salary=800000,JoiningDate=new DateTime(),Deparment="PHP" },
                new Employee(){ID=3,FirstName="Nayan",LastName="Joshi",Salary=700000,JoiningDate=new DateTime() ,Deparment="HR"},
                new Employee(){ID=4,FirstName="Aman",LastName="Gopani",Salary=600000,JoiningDate=new DateTime() ,Deparment="Dotnet"},
                new Employee(){ID=4,FirstName="Jay",LastName="Zalavadiya",Salary=600000,JoiningDate=new DateTime(2017,2,2) ,Deparment="Services"}

            };

            List<Incentive> incentives = new List<Incentive>()
            {
                new Incentive(){ID=1,IncentiveAmount=5000,IncentiveDate=new DateTime(2017,08,04)},
                new Incentive(){ID=2,IncentiveAmount=10000,IncentiveDate=new DateTime(2017,04,02)},
                new Incentive(){ID=1,IncentiveAmount=6000,IncentiveDate=new DateTime(2015,12,7)},
                new Incentive(){ID=2,IncentiveAmount=3000,IncentiveDate=new DateTime(2015,12,3)}
            };


            //1.Get employee details from employees object whose employee name is “John” (note restrict operator)

            var empDetailsMethod = employees.Where(i => i.FirstName == "Rutvik");
            foreach (var i in empDetailsMethod)
            {
                Console.WriteLine("FirstName :{0} | LastName :{1} | Salary :{2} | JoiningDate :{3} | Department :{4}", i.FirstName,i.LastName,i.Salary,i.JoiningDate,i.Deparment);
            }

            //2.Get FIRSTNAME,LASTNAMe from employees object(note project operator)

            var empDetails1 = employees.Select(i =>new {Firstname = i.FirstName,Lastname = i.LastName });

            foreach (var i in empDetails1)
            {
                Console.WriteLine(i);
            }

            //3.Select FirstName, IncentiveAmount from employees and incentives object for those employees who have incentives.(join operator)

            var empDetails3 = employees.Join(incentives, employee => employee.ID, incentive => incentive.ID, (employee, incentive) => new { FirstName = employee.FirstName, IncentiveAmount = incentive.IncentiveAmount });

            foreach(var obj in empDetails3)
            {
                Console.WriteLine("FirstName : {0},IncentiveAmount : {1}", obj.FirstName, obj.IncentiveAmount);
            }


            /*5.Select department, total salary with respect to a department from employees object
            where total salary greater than 800000 order by TotalSalary descending(group by having)*/
  
            var result = employees
                            .GroupBy(l => l.Deparment)
                            .Select(i => new 
                            {
                                department = i.Key,
                                Price = i.Sum(c => c.Salary),
                            }).Where(a=>a.Price > 800000);

            foreach(var i in result)
            {
                Console.WriteLine(i);
            }



            Console.ReadLine();
        }
    }
}