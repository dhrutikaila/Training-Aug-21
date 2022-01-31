--Sub Queries

--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary > (SELECT Salary FROM Employees WHERE LastName = 'Bull');

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT FirstName, LastName FROM Employees 
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName='IT');

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States.  
SELECT FirstName, LastName FROM Employees 
WHERE ManagerID in (select EmployeeID  FROM Employees WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE LocationID  IN (select LocationID  from Locations where CountryID='US')));

--4. Find the names (first_name, last_name) of the employees who are managers.
SELECT FirstName, LastName FROM Employees 
WHERE (EmployeeID  IN (SELECT ManagerID  FROM Employees));

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT FirstName, LastName, Salary  FROM Employees 
WHERE Salary  > (SELECT AVG(Salary ) FROM Employees);

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 

SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE Employees.Salary = (SELECT min_salary
FROM Jobs
WHERE Employees.JobId = Jobs.JobId);

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE DepartmentID IN 
(SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%') 
AND Salary > (SELECT avg(Salary) FROM Employees);

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.
SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE Salary > 
(SELECT Salary FROM Employees WHERE LastName = 'Bell') ORDER BY FirstName;

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT * FROM Employees 
WHERE Salary = (SELECT MIN(Salary) FROM Employees);

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department.
SELECT * FROM Employees 
WHERE Salary > 
ALL(SELECT avg(Salary)FROM Employees GROUP BY DepartmentID);

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest.
SELECT FirstName,LastName, JobId, Salary 
FROM Employees 
WHERE Salary > 
ALL (SELECT Salary FROM Employees WHERE JobId = 'SH_CLERK') ORDER BY Salary;

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors.
SELECT b.FirstName,b.LastName 
FROM Employees b 
WHERE NOT EXISTS (SELECT 'X' FROM Employees a WHERE a.ManagerID = b.EmployeeID);

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 

SELECT EmployeeID, FirstName, LastName, 
(SELECT DepartmentName FROM Departments d
 WHERE e.DepartmentID = d.DepartmentID) Department
 FROM Employees e ORDER BY Departments;

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.
SELECT EmployeeID, FirstName 
FROM Employees AS A 
WHERE Salary > 
(SELECT AVG(Salary) FROM Employees WHERE DepartmentID = A.DepartmentID);

--15. Write a query to fetch even numbered records from employees table.
SET @i = 0; 
SELECT i, EmployeeID 
FROM (SELECT @i := @i + 1 AS i, EmployeeID FROM Employees)
a WHERE MOD(a.i, 2) = 0;

--16. Write a query to find the 5th maximum salary in the employees table.
SELECT DISTINCT Salary 
FROM Employees e1 
WHERE 5 = (SELECT COUNT(DISTINCT Salary) 
FROM Employees  e2 
WHERE e2.Salary >= e1.Salary);

--17. Write a query to find the 4th minimum salary in the employees table.
SELECT DISTINCT Salary 
FROM Employees e1 
WHERE 4 = (SELECT COUNT(DISTINCT Salary) 
FROM Employees  e2 
WHERE e2.Salary <= e1.Salary);

--18. Write a query to select last 10 records from a table. 
SELECT * FROM (
SELECT * FROM Employees ORDER BY EmployeeID DESC LIMIT 10) sub 
ORDER BY EmployeeID ASC;

--19. Write a query to list department number, name for all the departments in which there are no employees in the department.
SELECT * FROM Departments 
WHERE DepartmentID 
NOT IN (select DepartmentID FROM Employees);

--20. Write a query to get 3 maximum salaries. 
SELECT DISTINCT Salary 
FROM Employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT Salary) 
FROM Employees b 
WHERE b.Salary >= a.Salary) 
ORDER BY a.Salary DESC;

--21. Write a query to get 3 minimum salaries. 
SELECT DISTINCT Salary 
FROM Employees a 
WHERE  3 >= (SELECT COUNT(DISTINCT Salary) 
FROM Employees b 
WHERE b.Salary <= a.Salary) 
ORDER BY a.Salary DESC;

--22. Write a query to get nth max salaries of employees.
SELECT *
FROM Employees emp1
WHERE (1) = (
SELECT COUNT(DISTINCT(emp2.Salary))
FROM Employees emp2
WHERE emp2.Salary > emp1.Salary);