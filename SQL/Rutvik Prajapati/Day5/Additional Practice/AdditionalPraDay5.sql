--Function:

--ISNULL()
    SELECT E.FirstName,ISNULL(I.IncentiveAmount,0) as 'Incentive Amount'
	FROM Employees AS E
	LEFT JOIN Incentives AS I ON E.EmployeeID = I.EmployeeID

--COALESCE
	SELECT E.FirstName,COALESCE(I.IncentiveAmount,0) as 'Incentive Amount'
	FROM Employees AS E
	LEFT JOIN Incentives AS I ON E.EmployeeID = I.EmployeeID

--CROSS JOIN
CREATE DATABASE EMPDB

CREATE TABLE Department(
DepartmentId INT PRIMARY KEY NOT NULL,
Name VARCHAR(30)
);
INSERT INTO Department VALUES(1,'IT'),
				      (2,'HR')

CREATE TABLE Emp(
Id INT PRIMARY KEY NOT NULL,
Name VARCHAR(20),
DepartmentId INT 
);


INSERT INTO Emp VALUES(1,'Maulik',1),
						(2,'Kinjal',2),
						(3,'Ravi',2),
						(4,'Krupal',1)

--CROSS JOIN 
USE EMPDB
SELECT *
FROM Emp 
CROSS JOIN Department 


--additional work 
USE SampleDB
--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'.
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bull')

--2. Find the names (first_name, last_name) of all employees who works in the IT department.
SELECT FirstName+' '+LastName AS Names
FROM Employees 
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT')

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States.
SELECT FirstName+' '+LastName AS Names
FROM Employees 
WHERE EmployeeID IN (SELECT ManagerID FROM Departments WHERE LocationID IN 
                    (SELECT LocationID FROM Locations WHERE CountryID = 
					  (SELECT CountryID FROM Countries WHERE CountryID = 'US')) )

--4. Find the names (first_name, last_name) of the employees who are managers.
SELECT FirstName+' '+LastName AS Names
FROM Employees 
WHERE EmployeeID IN (SELECT DISTINCT ManagerID FROM Employees)

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary.
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees 
WHERE Salary > (SELECT AVG(salary) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade.
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees
WHERE Salary = (SELECT MIN(salary) FROM Employees)

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments.
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees
WHERE Salary > (SELECT AVG(salary) FROM Employees) AND
DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT')

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bell')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments.
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees
WHERE Salary = (SELECT MIN(Salary) FROM Employees)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department.
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest.
SELECT FirstName+' '+LastName AS Names,Salary
FROM Employees
WHERE Salary >  (SELECT Salary FROM Employees WHERE JobId = 'SH_CLERK')

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors.
SELECT FirstName+' '+LastName AS Names
FROM Employees 
WHERE EmployeeID NOT IN (SELECT ManagerID FROM Employees);

--13. Write a query to display the employee ID, first name, last names, and department names of all employees.
SELECT E.EmployeeID,E.FirstName,E.LastName,D.DepartmentName
FROM Employees AS E
INNER JOIN Departments AS D ON E.DepartmentID = D.DepartmentID 

--OR

SELECT EmployeeID,FirstName,LastName,(SELECT DepartmentName FROM Departments D WHERE D.DepartmentID=E.DepartmentID)DEPARTMENT 
	 FROM Employees E;
--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.
SELECT EmployeeID,FirstName,LastName,Salary FROM Employees E
	 WHERE Salary>(SELECT avg(Salary) FROM Employees WHERE DepartmentID=E.DepartmentID);

--15. Write a query to fetch even numbered records from employees table.
SELECT *
FROM Employees 
WHERE EmployeeID%2 = 0; 

--16. Write a query to find the 5th maximum salary in the employees table.
SELECT SALARY 
FROM Employees E1
WHERE 5=(SELECT count(DISTINCT Salary) FROM Employees E2 WHERE E2.Salary>=E1.Salary)
--OR
SELECT TBL.Salary FROM
(SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RANK1,Salary
FROM Employees)TBL
WHERE TBL.RANK1 = 5


--17. Write a query to find the 4th minimum salary in the employees table.
SELECT SALARY 
FROM Employees E1
WHERE 4=(SELECT count(DISTINCT Salary) FROM Employees E2 WHERE E2.Salary<=E1.Salary)
--OR
SELECT DISTINCT TBL.Salary FROM
(SELECT DENSE_RANK() OVER (ORDER BY SALARY ASC) AS RANK1,Salary
FROM Employees)TBL
WHERE TBL.RANK1 = 4
--18. Write a query to select last 10 records from a table.
SELECT TOP 10 * FROM Employees ORDER BY EmployeeID DESC

--19. Write a query to list department number, name for all the departments in which there are no employees in the department.
SELECT DepartmentID,DepartmentName FROM Departments WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)


--20. Write a query to get 3 maximum salaries.
SELECT DISTINCT TOP 3  Salary FROM Employees ORDER BY Salary DESC

--21. Write a query to get 3 minimum salaries.
SELECT DISTINCT TOP 3  Salary FROM Employees ORDER BY Salary ASC

--22. Write a query to get nth max salaries of employees.
 SELECT Salary FROM Employees 
	 WHERE Salary=
	 (SELECT DISTINCT Salary FROM (SELECT Salary,dense_rank() OVER(ORDER BY Salary DESC)AS RANK FROM Employees)T1 WHERE RANK=1); 