/*
1.Write a query to find the names (first_name, last_name) and salaries of the employees who have higher 
salary than the employee whose last_name='Bull'.
*/

SELECT FirstName,LastName,Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bull')
ORDER BY FirstName


/*
2.Find the names (first_name, last_name) of all employees who works in the IT department.
*/
SELECT FirstName,LastName FROM Employees E,Departments D 
WHERE E.DepartmentID = D.DepartmentID AND D.DepartmentName='IT'


/*
3.Find the names (first_name, last_name) of the employees who have a manager who works 
for a department based in United States. 
*/
SELECT firstname, lastname FROM employees 
WHERE managerid in (select employeeid 
FROM employees WHERE departmentid 
IN (SELECT departmentid FROM departments WHERE locationid 
IN (select locationid from locations where countryid='US')));


/*
4.Find the names (first_name, last_name) of the employees who are managers. 
*/
SELECT FirstName,LastName FROM Employees 
WHERE EmployeeID IN (SELECT ManagerID FROM Employees WHERE ManagerID <>0) 


/*
5.Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
*/
SELECT (FirstName + ' ' + LastName) [Name],Salary FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees)


/*
6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the 
minimum salary for their job grade. 
*/
SELECT FirstName,Lastname,Salary,JobId FROM Employees AS Emp
WHERE Salary = (
    SELECT MIN(Salary)
    FROM Employees
    WHERE JobId = Emp.JobId
)


/*
7. Find the names (first_name, last_name), salary of the employees who earn more than the 
average salary and who works in any of the IT departments. 
*/
SELECT FirstName,LastName,Salary From Employees
WHERE Salary > (Select AVG(Salary) FROM Employees)
AND DepartmentID IN (SELECT DepartmentID From Departments WHERE DepartmentName LIKE 'IT%')

/*
8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
*/
SELECT FirstName,LastName,Salary From Employees
WHERE SALARY > (SELECT SALARY FROM Employees WHERE FirstName = 'Bell' OR LastName='Bell')

/*
9. Find the names (first_name, last_name), salary of the employees who earn the same salary as 
the minimum salary for all departments. 
*/
SELECT FirstName,Lastname,Salary,DepartmentID FROM Employees AS Emp
WHERE Salary = (
    SELECT MIN(Salary)
    FROM Employees
    WHERE DepartmentID = Emp.DepartmentID
)


/*
10. Find the names (first_name, last_name), salary of the employees whose salary greater than average 
salary of all department. 
*/

SELECT FirstName,Lastname,Salary
FROM EMPLOYEES
WHERE SALARY >
(SELECT AVG(SALARY) FROM (SELECT AVG(SALARY) Salary FROM EMPLOYEES GROUP BY DepartmentID) tmp)


/*
11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a 
salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
Sort the results on salary from the lowest to highest. 
*/
SELECT FirstName,LastName,Salary FROM Employees
WHERE Salary > (SELECT MAX(Salary) From Employees WHERE JobId = 'SH_CLERK') ORDER BY Salary


/*
12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
*/
SELECT FirstName,LastName From Employees 
WHERE EmployeeID NOT IN (SELECT ManagerID FROM Employees)


/*
13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
*/
SELECT E.EmployeeID,E.FirstName,E.LastName,D.DepartmentName From Employees E,Departments D
WHERE E.DepartmentID = D.DepartmentID


/*
14. Write a query to display the employee ID, first name, last names, salary of all employees whose 
salary is above average for their departments. 
*/
SELECT EmployeeID,FirstName,LastName,Salary,DepartmentID FROM Employees E
WHERE Salary > (SELECT AVG(Salary) FROM Employees E1
WHERE E.DepartmentID=E1.DepartmentID  GROUP BY DepartmentID)

/*
15. Write a query to fetch even numbered records from employees table. 
*/
SELECT * FROM (SELECT  ROW_NUMBER() OVER (ORDER BY EmployeeID) [Index],* FROM Employees)a
WHERE [Index]%2=0


/*
16. Write a query to find the 5th maximum salary in the employees table. 
*/
SELECT Salary FROM
(Select DISTINCT DENSE_RANK() OVER (ORDER BY Salary DESC)[Rank],Salary FROM Employees)a
WHERE Rank=5

/*
17. Write a query to find the 4th minimum salary in the employees table. 
*/
SELECT Salary FROM
(Select DISTINCT DENSE_RANK() OVER (ORDER BY Salary)[Rank],Salary FROM Employees)a
WHERE Rank=4


/*
18. Write a query to select last 10 records from a table. 
*/
SELECT TOP(10) * FROM Employees

/*
19. Write a query to list department number, name for all the departments in which there are no employees 
in the department. 
*/
SELECT D.DepartmentID,D.DepartmentName FROM Departments D
WHERE D.DepartmentID NOT IN (SELECT DepartmentID FROM Employees)


/*
20. Write a query to get 3 maximum salaries. 
*/
SELECT TOP(3) Salary FROM
(Select DISTINCT DENSE_RANK() OVER (ORDER BY Salary DESC)[Rank],Salary FROM Employees)a

/*
21. Write a query to get 3 minimum salaries. 
*/
SELECT TOP(3) Salary FROM
(Select DISTINCT DENSE_RANK() OVER (ORDER BY Salary)[Rank],Salary FROM Employees)a

/*
22. Write a query to get nth max salaries of employees. 
*/
DECLARE @N INT = 5
SELECT Salary FROM
(Select DISTINCT DENSE_RANK() OVER (ORDER BY Salary DESC)[Rank],Salary FROM Employees)a
WHERE RANK=@N
