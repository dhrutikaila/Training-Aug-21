using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace CollectionPractice
{
    class employee
    {
        public int empId { get; set; } 
        public string empName { get; set; }
        public int empSalary { get; set; }
        public employee(int id,string name ,int salary)
        {
            this.empId = id;
            this.empName = name;
            this.empSalary = salary;
        }
    }
    class Program
    {
       
        static void Main(string[] args)
        {
            var employee = new employee[5];
            for(int i = 0; i < employee.Length; i++)
            {

                employee[i] = new employee(1,"shreya", 20000);
            }
            Console.WriteLine("Employee details :");
            foreach(employee emp in employee)
            {
                Console.WriteLine("Employee Id is  : "+emp.empId +'\n'+ "Employee name is  :"+emp.empName+'\n'+"Employee salary is :"+emp.empSalary+'\n');
            }
            Console.ReadLine();
        }
    }
}
