using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_7_8
{
    class Assignment1_Day7_8
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
        static void Main(string[] args)
        {
            List<Employee> employees = new List<Employee>()

            {

                new Employee(){ ID=1,FirstName="John",LastName="Abraham",Salary=1000000,JoiningDate=new DateTime(2013,1,1),Deparment="Banking"},

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

            //Query 1: Get employee details from employees object whose employee name is “John” (note restrict operator)
            var query1 = employees.Where(s => s.FirstName == "John");
            Console.WriteLine("-----------Query1 answer-----------");
            foreach (var e in query1)
            {
                Console.WriteLine($"ID: {e.ID} \nFirstName: {e.FirstName} \nLastName: {e.LastName} \nSalary: {e.Salary} \nJoiningDate: {e.JoiningDate} \nDepartment: {e.Deparment}");
            }
            Console.WriteLine("\n+++++++++++++++++++++++++++++++++++\n");

            //Query 2: Get FIRSTNAME,LASTNAMe from employees object(note project operator)
            var query2 = from s in employees
                         select new { FirstName = s.FirstName, LastName = s.LastName };
            Console.WriteLine("-----------Query2 answer-----------");
            foreach (var e in query2)
            {
                Console.WriteLine($"FirstName: {e.FirstName} , LastName: {e.LastName}\n");
            }
            Console.WriteLine("\n+++++++++++++++++++++++++++++++++++\n");

            //Query3: Select FirstName, IncentiveAmount from employees and incentives object for those employees who have incentives.(join operator)
            var query3 = employees.Join( 
                      incentives,  
                      employee => employee.ID,    
                      incentive => incentive.ID,  
                      (employee, incentive) => new  
                      {
                          FirstName = employee.FirstName,
                          IncentiveAmount = incentive.IncentiveAmount
                      });
            Console.WriteLine("-----------Query3 answer-----------");
            foreach (var e in query3)
            {
                Console.WriteLine($"FirstName: {e.FirstName} , IncentiveAmount: {e.IncentiveAmount}\n");
            }
            Console.WriteLine("\n+++++++++++++++++++++++++++++++++++\n");

            //Query 4: Get department wise maximum salary from employee table order by salary ascending (note group by)
            var query4 = from e in employees
                         group e by e.Deparment into temp
                         let deptMaxSal = (temp.Select(sal => sal.Salary)).Max()
                         orderby deptMaxSal
                         select new { temp.Key, deptMaxSal };
            Console.WriteLine("-----------Query4 answer-----------");
            foreach (var res in query4)
            {
                Console.WriteLine($"Department: {res.Key}, Salary: {res.deptMaxSal}");
            }
            Console.WriteLine("\n+++++++++++++++++++++++++++++++++++\n");

            //Query 5: Select department, total salary with respect to a department from employees object where total salary greater than 800000 order by TotalSalary descending(group by having)

            Console.WriteLine("-----------Query5 answer-----------");
            var query5 = from e in employees
                         group e by e.Deparment into eSal
                         let Salary = (eSal.Select(sal => sal.Salary)).Sum()
                         where Salary > 800000
                         orderby Salary descending
                         select new { eSal.Key, Salary };

            foreach(var res in query5)
            {
                Console.WriteLine($"DepartmentName: {res.Key}, Salary: {res.Salary}");
            }


            Console.WriteLine("\n+++++++++++++++++++++++++++++++++++\n");
        }
    }
}
