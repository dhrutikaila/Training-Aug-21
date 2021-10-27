/*1. Write a query to find the names (first_name, last_name) and salaries of the employees 
who have higher salary than the employee whose last_name='Bull'.*/ 
SELECT (FirstName+' '+ LastName) 'NAME',Salary FROM Employees WHERE 
Salary > (SELECT Salary FROM Employees WHERE LastName='BULL')

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT (FirstName+' '+LastName) FROM Employees WHERE DepartmentID 
IN(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT') 

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
SELECT (FirstName+' '+LastName) 'NAME' FROM Employees WHERE ManagerID
IN (SELECT EmployeeID FROM Employees WHERE DepartmentID 
IN (SELECT DepartmentID FROM Departments WHERE LocationID
IN(SELECT LocationID FROM Locations WHERE CountryID='US')
))


--4. Find the names (first_name, last_name) of the employees who are managers. 
SELECT (mgr.FirstName+' '+mgr.LastName) 'Manager Name' 
FROM Employees e JOIN Employees mgr ON
e.ManagerID = mgr.EmployeeID  GROUP BY (mgr.FirstName+' '+mgr.LastName)

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

SELECT AVG(Salary)  FROM Employees

SELECT FirstName+' '+LastName AS 'NAME',Salary
FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT MIN(Salary) FROM Employees

SELECT FirstName+' '+LastName AS 'NAME',Salary ,JobId
FROM Employees AS Emp
WHERE Salary = (SELECT MIN(Salary) FROM Employees
WHERE JobId = Emp.JobId)

/*7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and 
who works in any of the IT departments.*/ 
SELECT FirstName+' '+LastName AS 'NAME',Salary
FROM Employees WHERE Salary > 
(SELECT AVG(Salary) FROM Employees) AND DepartmentID IN
(SELECT DepartmentID FROM Departments WHERE DepartmentName ='IT')


--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT FirstName+' '+LastName AS 'NAME',Salary
FROM Employees WHERE Salary >(SELECT Salary FROM Employees WHERE LastName='BeLL')


--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT FirstName+' '+LastName AS 'NAME',Salary
FROM Employees e
WHERE Salary = (SELECT MIN(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID )

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT FirstName+' '+LastName AS 'NAME',Salary , DepartmentID
FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees
WHERE DepartmentID IN
(SELECT DepartmentID FROM Departments))

/*11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a
salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. */

SELECT FirstName+' '+LastName AS 'NAME', Salary FROM Employees WHERE Salary >
ALL(SELECT Salary FROM Employees WHERE JobId='SH_CLERK') ORDER BY Salary ASC

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

SELECT(FirstName+' '+LastName) 'Manager Name'  FROM Employees
WHERE EmployeeID NOT IN
(SELECT ManagerID FROM Employees)

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 

SELECT  e.EmployeeID,(e.FirstName+' '+e.LastName) 'Name',d.DepartmentName FROM Employees e 
JOIN Departments d ON e.DepartmentID=d.DepartmentID

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 


SELECT EmployeeID,FirstName,LastName, Salary FROM Employees e WHERE Salary >
(SELECT AVG(Salary) FROM Employees  WHERE DepartmentID=e.DepartmentID)


--15. Write a query to fetch even numbered records from employees table. 

SELECT * FROM Employees WHERE EmployeeID % 2 =0

--using raw_number function


SELECT * FROM
(SELECT  ROW_NUMBER() OVER (ORDER BY EmployeeID) 'EvenRecord',* FROM Employees)a 
WHERE EvenRecord %2=0

--16. Write a query to find the 5th maximum salary in the employees table. 

SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary desc)AS drank , salary
FROM Employees) tmp 
WHERE drank=5

SELECT salary from Employees e WHERE 5 =
(SELECT COUNT(Salary) from Employees y where y.Salary>e.Salary)

--17. Write a query to find the 4th minimum salary in the employees table. 

SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary ASC)AS drank , salary FROM Employees) tmp 
	WHERE drank=4 

--18. Write a query to select last 10 records from a table. 

SELECT * FROM
(SELECT TOP 10 FirstName+' '+LastName 'NAME',EmployeeID  FROM Employees ORDER BY EmployeeID DESC )tmp
ORDER BY EmployeeID  ASC

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 

SELECT DepartmentID,DepartmentName FROM Departments WHERE DepartmentID NOT IN 
(SELECT DepartmentID FROM Employees)

--20. Write a query to get 3 maximum salaries. 

SELECT * FROM(
SELECT DENSE_RANK() over (order by salary desc) sal_rank,EmployeeID,FirstName,LastName,
Salary 
FROM Employees)EMP
WHERE SAL_RANK<=3

--21. Write a query to get 3 minimum salaries. 

SELECT * FROM(
SELECT DENSE_RANK() over (order by salary ) sal_rank,EmployeeID,FirstName,LastName,Salary 
FROM Employees)EMP
WHERE SAL_RANK<=3


--22. Write a query to get nth max salaries of employees. 

DECLARE @n INT = 7
SELECT Salary FROM
(Select DISTINCT DENSE_RANK() OVER (ORDER BY Salary DESC)[Rank],Salary FROM Employees)a
WHERE RANK=@n
