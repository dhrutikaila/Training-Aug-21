
/* query1 */
/*SELECT employee details FROM employee TABLE if data exists in incentive TABLE ?*/
SELECT * FROM Incentive2
SELECT * FROM Employees where EmployeeID in (SELECT EmployeeID FROM Incentive2);
/* Query2 
Find Salary of the employee whose salary is more than Roy Salary*/

SELECT * FROM employees
SELECT Salary FROM employees where salary>(SELECT Salary FROM employees where FirstName='Adam');


/* query3
CREATE a view to SELECT FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount */
CREATE view incentive3 as SELECT a.FirstName,a.LastName,a.Salary,a.JoiningDate,b.IncentiveDate,b.incentiveAmount FROM Employees a join Incentive2 b on a.EmployeeID=b.EmployeeID;
SELECT * FROM incentive3;

/* query4 
CREATE a view to SELECT SELECT first_name, incentive amount FROM employee and incentives TABLE for those employees who have incentives and incentive amount greater than 3000 */
CREATE view incentive4 as SELECT a.FirstName,a.LastName,b.IncentiveAmount FROM Employees as a join Incentive2 b on a.EmployeeID=b.EmployeeID where b.IncentiveAmount>3000;
SELECT * FROM incentive4;


/* Additional Task */
/*
1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
*/
SELECT FirstName,LastName,Salary FROM Employees where Salary>(SELECT Salary FROM Employees where LastName='Bull');

/*
2. Find the names (first_name, last_name) of all employees who works in the IT department. 
*/
SELECT * FROM Departments
SELECT FirstName,LastName FROM Employees where DepartmentID=(SELECT DepartmentID FROM Departments where DepartmentName='IT');
/*
3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
*/
SELECT * FROM Countries
SELECT FirstName,LastName FROM Employees where DepartmentID in (SELECT DepartmentID FROM Departments where LocationID in (SELECT LocationID FROM Locations where CountryID = (SELECT CountryID FROM Countries where CountryName='United States of America'))); 

/*
Hint : Write single-row and multiple-row subqueries

4. Find the names (first_name, last_name) of the employees who are managers. 
*/
SELECT FirstName,LastName FROM Employees where ManagerID in (SELECT EmployeeID FROM Employees);

/*
5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
*/
SELECT FirstName,LastName,Salary FROM Employees where Salary>(SELECT avg(Salary) FROM Employees);

/*
6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
*/
SELECT e.FirstName,e.LastName,e.Salary FROM Employees as e where Salary in (SELECT min(e1.Salary) FROM Employees as e1 where e1.JobId=e.JobId group by e1.JobId);
/*
7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
*/
SELECT e.FirstName,e.LastName,e.Salary,e.DepartmentID FROM Employees as e where Salary > (SELECT avg(e1.Salary) FROM Employees as e1) and DepartmentID=(SELECT DepartmentID FROM Departments where DepartmentName='IT');

/* 8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
*/
SELECT * FROM Employees
SELECT e.FirstName,e.LastName,e.Salary FROM Employees as e where Salary>(SELECT Salary FROM Employees where LastName='Bell');

/*
9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
*/
SELECT e.FirstName,e.LastName,e.Salary FROM Employees as e where Salary = (SELECT min(e1.Salary) FROM Employees as e1 );
/*
10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
*/
SELECT e.FirstName,e.LastName,e.Salary FROM Employees as e where Salary > (SELECT avg(e1.Salary) FROM Employees as e1);


/*
11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary FROM the lowest to highest. 
*/
SELECT e.FirstName,e.LastName,e.Salary FROM Employees as e where Salary > (SELECT avg(e1.Salary) FROM Employees as e1 where e1.JobId='SH_CLERK') order by e.Salary asc;

/*
12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
*/
SELECT * FROM Employees
SELECT e.FirstName,e.LastName,e.Salary,e.DepartmentID FROM Employees as e where DepartmentID not in (SELECT ManagerID FROM Employees);
/*
13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
*/
SELECT e.EmployeeID,FirstName,e.LastName,d.DepartmentName FROM Employees as e join Departments as d on e.DepartmentID=d.DepartmentID;

/*
14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
*/
SELECT e.EmployeeID,e.FirstName,e.LastName,e.Salary FROM Employees e where Salary>(SELECT avg(e1.Salary) FROM Employees as e1 where e.DepartmentID=e1.DepartmentID); 

/*
15. Write a query to fetch even numbered records FROM employees TABLE.*/ 
SELECT * FROM Employees where EmployeeId % 2 = 0
/*
16. Write a query to find the 5th maximum salary in the employees TABLE. */
SELECT *
FROM
  (SELECT e.*, Dense_Rank() over (order by salary desc) as m FROM employees e) as tbl where tbl.m=5; 
/*
17. Write a query to find the 4th minimum salary in the employees TABLE. 
*/
SELECT *
FROM
  (SELECT e.*, Dense_Rank() over (order by salary ASC) as m FROM employees e) as tbl where tbl.m=4;

/*18. Write a query to SELECT last 10 records FROM a TABLE. 
*/

SELECT *
FROM
  (SELECT e.*, Dense_Rank() over (order by salary DESC) as m FROM employees e) as tbl where tbl.m<=3;
/*
19. Write a query to list department number, name for all the departments in which there are no employees in the department. 
*/
SELECT DepartmentID,DepartmentName FROM Departments where DepartmentID not in (SELECT DepartmentID FROM Employees);
/*
20. Write a query to get 3 maximum salaries. 
*/
--below is not preffer
SELECT top 3 salary FROM employees
order by salary ;
--or 

SELECT *
FROM
  (SELECT e.*, Dense_Rank() over (order by salary DESC) as m FROM employees e) as tbl where tbl.m<=3;

/*
21. Write a query to get 3 minimum salaries. */

SELECT top 3 salary FROM employees
order by salary asc;
--or 
SELECT *
FROM
  (SELECT e.*, Dense_Rank() over (order by salary ASC) as m FROM employees e) as tbl where tbl.m<=3;
/*
22. Write a query to get nth max salaries of employees. 
*/
--assume n is 10 
SELECT *
FROM
  (SELECT e.*, Dense_Rank() over (order by salary Desc) as rank FROM employees e) as tbl where tbl.rank=10;


