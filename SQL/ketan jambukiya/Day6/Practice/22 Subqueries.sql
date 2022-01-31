USE sqlfunction

QUERY 1

-- Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 

select FirstName,LastName,Salary from Employee where Salary>(select Salary From EMPLOYEE where LastName='Bull')

QUERY 2

-- Find the names (first_name, last_name) of all employees who works in the IT department. 

select FirstName,LastName from Employees
where DepartmentID IN (select DepartmentID from Departments Where DepartmentName='IT')

Query 3

-- Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 

select FirstName,LastName from Employees where DepartmentID in
(select DepartmentId from Departments where LocationID in
(select LocationID from Locations where CountryID =
(select CountryID from Countries where CountryName = 'United States of America')))

Query 4

--Find the names (first_name, last_name) of the employees who are managers. 

select FirstName,LastName from Employees where ManagerID in ( select ManagerID from Employees)

Query 5

--Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

select FirstName,LastName,Salary from Employees where Salary in
(select Salary from Employees where Salary>
(select avg(Salary) from Employees))

Query 6

--Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 

select FirstName,LastName,Salary from Employees where Salary =
(select Min(Salary) from Employees)

Query 7

--Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

SELECT FirstName, LastName,Salary 
FROM Employees 
WHERE DepartmentID IN 
(SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT') 
AND salary > (SELECT avg(salary) FROM employees);

Query 8

--Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 

select FirstName,LastName,Salary from Employees where Salary > 
( select Salary from Employees where LastName='Bell')

Query 9

--Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 

Select FirstName,LastName,Salary from Employees where Salary=
(select min(Salary) from Employees) 

Query 10

--Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 

select FirstName,LastName,Salary from Employees where Salary > 
(select avg(Salary) From Employees)

Query 11

--Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 

select FirstName,LastName ,Salary From Employees where Salary >
(select max(salary) from Employees where JobId='SH_CLERK') order by Salary asc

Query 12

--Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

select FirstName,LastName,ManagerID from Employees where not Exists 
( select ManagerID from Employees )


QUERY 13

--Write a query to display the employee ID, first name, last names, and department names of all employees. 

select  EmployeeId, FirstName,LastName,
(select DepartmentName from Departments d where e.DepartmentID=d.DepartmentID) as Departmentname 
from Employees e

Query 14

--Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 

select EmployeeID,FirstName,LastName,Salary from Employees as a where Salary >
(SELECT AVG(salary) FROM Employees WHERE  DepartmentID= a.DepartmentID)

QUERY 15

--Write a query to fetch even numbered records from employees table. 

select * from Employees where EmployeeID % 2=0

Query 16

--Write a query to find the 5th maximum salary in the employees table. 

 Select Salary From 
(Select DENSE_RANK() over (ORDER BY Salary DESC) 'DNS_RANK' , Salary from Employees) NEW  
where  DNS_RANK = 5

Query 17

--Write a query to find the 4th minimum salary in the employees table. 
	
Select Salary From 
(Select DENSE_RANK() OVER (ORDER BY Salary) 'DNS_RANK' , Salary From Employees) NEW  
where DNS_RANK = 4

QUERY 18

--Write a query to select last 10 records from a table. 

select top(10) * from Employees order by EmployeeID DESC

Query 19
	
--Write a query to list department number, name for all the departments in which there are no employees in the department. 

select DepartmentID,DepartmentName from Departments where DepartmentID not in
( select DepartmentID from Employees )

Query 20

--Write a query to get 3 maximum salaries. 

Select DISTINCT top(3) Salary from Employees order by Salary DESC

Query 21

--Write a query to get 3 minimum salaries. 

Select DISTINCT top(3) Salary from Employees order by Salary asc

QUERY 22

--Write a query to get nth max salaries of employees. 

Select DISTINCT top(n) Salary from Employees order by Salary DESC

