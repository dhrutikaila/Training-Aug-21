
USE SqlDay6
SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM JobHistory
SELECT * FROM Countries
SELECT * FROM Locations

--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 

SELECT FirstName + ' ' + LastName AS [Name], Salary FROM Employees WHERE Salary > ( SELECT Salary FROM Employees WHERE LastName='Bull')

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 

SELECT FirstName + ' ' + LastName AS [Employees Works in IT dept] FROM Employees WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE '%IT%')

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
--Hint : Write single-row and multiple-row subqueries

SELECT FirstName + ' ' + LastName AS [Name], ManagerID FROM Employees WHERE ManagerID IN 
( SELECT ManagerID FROM Employees WHERE DepartmentID IN 
( SELECT DepartmentID FROM Departments WHERE LocationID IN 
( SELECT LocationID FROM Locations WHERE CountryID IN 
(SELECT CountryID FROM Countries WHERE CountryName LIKE '%United States%'))))

--4. Find the names (first_name, last_name) of the employees who are managers. 

SELECT FirstName + ' ' + LastName AS [Name], ManagerID FROM Employees WHERE ManagerID <> 0

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

SELECT FirstName + ' ' + LastName AS [Name], Salary FROM Employees WHERE Salary > ( SELECT AVG(Salary) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 

SELECT FirstName + ' ' + LastName AS [Name],Salary,JobId FROM Employees e1 WHERE Salary =
( SELECT MIN(Salary) FROM Employees e2 WHERE e2.JobId = e1.JobId GROUP BY JobId)

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

SELECT FirstName + ' ' + LastName AS [Name], Salary FROM Employees WHERE Salary > ( SELECT AVG(Salary) FROM Employees WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE '%IT%'))

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 

SELECT FirstName + ' ' + LastName AS [Name], Salary FROM Employees WHERE Salary > ( SELECT Salary FROM Employees WHERE FirstName + LastName LIKE '%Bell%')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary 
--for all departments. 

SELECT FirstName + ' ' + LastName AS [Name],Salary,DepartmentID FROM Employees e1 WHERE Salary =
( SELECT MIN(Salary) FROM Employees e2 WHERE e2.DepartmentID = e1.DepartmentID GROUP BY DepartmentID)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 

SELECT FirstName + ' ' + LastName AS [Name],Salary,DepartmentID FROM Employees WHERE Salary >
( SELECT AVG(Salary) FROM Employees )

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary 
--that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary 
--from the lowest to highest.

SELECT FirstName + ' ' + LastName AS [Name], Salary,JObID FROM Employees WHERE Salary > 
(SELECT MAX(Salary) FROM Employees WHERE JobId = 'SH_CLERK') ORDER BY Salary

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

SELECT FirstName + ' ' LastName,JobId FROM Employees WHERE JobId <> 'supervisor'

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 

SELECT e.EmployeeId, e.FirstName, e.LastName, d.DepartmentName FROM Employees e LEFT JOIN Departments d ON e.DepartmentID=d.DepartmentID

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary 
--is above average for their departments. 

SELECT FirstName + ' ' + LastName AS [Name],Salary,DepartmentID FROM Employees e1 WHERE Salary >
( SELECT AVG(Salary) FROM Employees e2 WHERE e2.DepartmentID = e1.DepartmentID GROUP BY DepartmentID)

--15. Write a query to fetch even numbered records from employees table. 

SELECT * FROM (SELECT ROW_NUMBER() OVER ( ORDER BY EmployeeID ASC) AS ROWNO,* FROM Employees) tmp WHERE ROWNO%2 = 0

--16. Write a query to find the 5th maximum salary in the employees table. 

SELECT DISTINCT Salary FROM (SELECT DENSE_RANK() OVER ( ORDER BY Salary DESC ) AS Rank_By_Salry,Salary FROM Employees ) tmp WHERE Rank_By_Salry = 5

--17. Write a query to find the 4th minimum salary in the employees table. 

SELECT DISTINCT Salary FROM (SELECT DENSE_RANK() OVER ( ORDER BY Salary ASC ) AS Rank_By_Salry,Salary FROM Employees ) tmp WHERE Rank_By_Salry = 4

--18. Write a query to select last 10 records from a table. 

SELECT * FROM ( SELECT ROW_NUMBER() OVER( ORDER BY EmployeeId DESC ) AS ROWNO,* FROM Employees ) tmp WHERE ROWNO <=10

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 

SELECT DepartmentID,DepartmentName FROM Departments WHERE DepartmentID NOT IN ( SELECT DepartmentID FROM Employees) 

--20. Write a query to get 3 maximum salaries. 

SELECT DISTINCT Salary FROM (SELECT DENSE_RANK() OVER ( ORDER BY Salary DESC ) AS Rank_By_Salry,Salary FROM Employees ) tmp WHERE Rank_By_Salry <=3 ORDER BY Salary DESC

--21. Write a query to get 3 minimum salaries. 

SELECT DISTINCT Salary FROM (SELECT DENSE_RANK() OVER ( ORDER BY Salary ASC ) AS Rank_By_Salry,Salary FROM Employees ) tmp WHERE Rank_By_Salry <=3 ORDER BY Salary

--22. Write a query to get nth max salaries of employees. 
DECLARE @VAR INT = 5;
SELECT DISTINCT Salary FROM (SELECT DENSE_RANK() OVER ( ORDER BY Salary DESC ) AS Rank_By_Salry,Salary FROM Employees ) tmp WHERE Rank_By_Salry = @VAR
