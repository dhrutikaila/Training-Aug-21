using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Day7
{
    class Employee

    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public double Salary { get; set; }
        public DateTime JoiningDate { get; set; }
        public string Deparment { get; set; }
    }
    class Incentive
    {
        public int ID { get; set; }
        public double IncentiveAmount { get; set; }
        public DateTime IncentiveDate { get; set; }
    }
    class Assignment_7
    {
        static void Main(string[] args)
        {
            List<Employee> employees = new List<Employee>()
            {
                new Employee(){ID=1,FirstName="John",LastName="Abraham",Salary=1000000,JoiningDate=new DateTime(2013,1,1),Deparment="Banking"},
                new Employee(){ID=2,FirstName="Michael",LastName="Clarke",Salary=800000,JoiningDate=new DateTime(),Deparment="Insurance" },
                new Employee(){ID=3,FirstName="oy",LastName="Thomas",Salary=700000,JoiningDate=new DateTime() ,Deparment="Insurance"},
                new Employee(){ID=4,FirstName="Tom",LastName="Jose",Salary=600000,JoiningDate=new DateTime() ,Deparment="Banking"},
                new Employee(){ID=4,FirstName="TestName2",LastName="Lname%",Salary=600000,JoiningDate=new DateTime(2013,1,1) ,Deparment="Services"}
            };
            List<Incentive> incentives = new List<Incentive>()
            {
                new Incentive(){ ID=1,IncentiveAmount=5000,IncentiveDate=new DateTime(2013,02,02)},
                new Incentive(){ID=2,IncentiveAmount=10000,IncentiveDate=new DateTime(2013,02,4)},
                new Incentive(){ID=1,IncentiveAmount=6000,IncentiveDate=new DateTime(2012,01,5)},
                new Incentive(){ID=2,IncentiveAmount=3000,IncentiveDate=new DateTime(2012,01,5)}
            };
            //Get employee details from employees object whose employee name is “John” (note restrict operator)
            var q1 = from fname in employees where fname.FirstName == "John" select fname;
            Console.WriteLine("-------------Que-1--------------");
            foreach(var data in q1)
            {
                Console.WriteLine("Record is :" );
                Console.WriteLine("Id is {0} Firstname is {1} Lastname is {2} Salary is {3} Joining Date is {4} Department is {5}",data.ID,data.FirstName,data.LastName,data.Salary,data.JoiningDate,data.Deparment);
            }
            //Get FIRSTNAME,LASTNAMe from employees object(note project operator)
            Console.WriteLine("-------------Que-2--------------");
            var q2 = from name in employees select new { name.FirstName ,name.LastName };
            Console.WriteLine("Record is :");
            foreach (var data in q2)
            {
               
                Console.WriteLine(data.FirstName+" "+data.LastName);
            }
            //Select FirstName, IncentiveAmount from employees and incentives object for those employees who have incentives.(join operator)
            Console.WriteLine("-------------Que-3--------------");
            var res = (from e in employees
                       join i in incentives on e.ID equals i.ID
                       select new
                       {
                           e.ID,
                           e.FirstName,
                           i.IncentiveAmount
                       });
            foreach (var data in res)
            {
                Console.WriteLine(data.ID + " " + data.FirstName+" "+data.IncentiveAmount);
            }
            //Get department wise maximum salary from employee table order by salary ascending (note group by)
            Console.WriteLine("-------------Que-4--------------");
            var result = (from a in employees group a by a.Deparment into deptgroup orderby deptgroup.Key ascending select deptgroup);
            foreach (var data in result)
            {
                Console.WriteLine("Department : {0}",data.Key);
                foreach(var dept in data)
                {
                    Console.WriteLine("Firstname is {0} salary is {1}",dept.FirstName,dept.Salary);
                }
            }
            // Select department, total salary with respect to a department from employees object where total 
            //salary greater than 800000 order by TotalSalary descending(group by having)
            Console.WriteLine("-------------Que-5--------------");
            var res1 = from emp in employees
                       where emp.Salary > 800000
                       group emp by emp.Deparment into deptgroup
                       select deptgroup;
            foreach (var data in res1)
            {
                Console.WriteLine(data.Key);
                foreach(var ans in data)
                {
                    Console.WriteLine("Firstname is {0} department is {1} salary is {2}", ans.FirstName,ans.Deparment,ans.Salary);
                }
            }
            Console.ReadLine();
        }
    }
}
