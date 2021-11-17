
/*  1. Write a query to find the names (first_name, last_name) and salaries of the employees 
who have higher salary than the employee whose last_name='Bull' */ 

SELECT * FROM Employees
SELECT * FROM Departments

SELECT FirstName+' '+LastName AS NAME, Salary  FROM Employees WHERE Salary > 
(SELECT Salary FROM Employees WHERE LastName = 'Bull')

/* 2. Find the names (first_name, last_name) of all employees who works in the IT department. */ 

SELECT E.FirstName+' '+E.LastName AS NAME, E.DepartmentID,D.DepartmentName FROM Employees E
JOIN Departments D ON E.DepartmentID=D.DepartmentID WHERE D.DepartmentName='IT'

/* 3. Find the names (first_name, last_name) of the employees who have a manager who works for
a department based in United States.  */

SELECT FirstName+' '+LastName FROM employees WHERE ManagerID in (select EmployeeID FROM employees WHERE DepartmentID 
IN (SELECT DepartmentID FROM departments WHERE LocationID 
IN (select LocationID from locations where CountryID='US')));

/* 4. Find the names (first_name, last_name) of the employees who are managers.  */
 
 SELECT FirstName+' '+LastName AS NAME FROM Employees WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

 /* 5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. */

 SELECT FirstName+' '+LastName AS NAME,Salary FROM Employees WHERE Salary >
 (SELECT AVG(Salary) FROM Employees)
 
 /* 6. Find the names (first_name, last_name), salary of the employees 
 whose salary is equal to the minimum salary for their job grade.  */ 

 SELECT E.FirstName+' '+E.LastName AS NAME,E.Salary FROM Employees E WHERE E.Salary = 
 (SELECT J.Min_Salary FROM Job J  WHERE E.JobId = J.Job_Id

 /* 7. Find the names (first_name, last_name), salary of the employees who earn more 
 than the average salary and who works in any of the IT departments.  */

 SELECT FirstName, LastName, salary FROM Employees 
 WHERE DepartmentID IN(SELECT DepartmentID FROM departments WHERE DepartmentName LIKE 'IT%') 
 AND salary > (SELECT avg(salary) FROM Employees)

 /* 8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.  */
 
 SELECT FirstName, LastName, salary FROM Employees 
WHERE salary > (SELECT salary FROM Employees WHERE LastName = 'Bell') 

 /* 9. Find the names (first_name, last_name), salary of the employees
 who earn the same salary as the minimum salary for all departments.  */ 

 SELECT FirstName+' '+LastName AS NAME,Salary FROM Employees WHERE salary = (SELECT MIN(salary) FROM Employees)

/* 10. Find the names (first_name, last_name), salary of the employees whose salary greater than 
average salary of all department. */ 
 
 SELECT FirstName+' '+LastName AS NAME,Salary FROM Employees WHERE salary > 
 ALL(SELECT avg(salary)FROM Employees GROUP BY DepartmentID)

 /* 11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that 
 is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from 
 the lowest to highest. */

 SELECT FirstName,LastName, JobId, Salary FROM Employees 
 WHERE salary > ALL (SELECT salary FROM Employees WHERE JobId = 'SH_CLERK') ORDER BY salary

/* 12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors.  */

 SELECT E.FirstName,E.LastName FROM Employees E 
WHERE NOT EXISTS (SELECT * FROM Employees B WHERE B.ManagerID = E.EmployeeID)

/* 13. Write a query to display the employee ID, first name, last names, and department names of all employees. */ 

SELECT E.EmployeeID, E.FirstName+'  '+E.LastName AS NAME FROM Employees E 
WHERE DepartmentID IN (SELECT D.DepartmentName FROM Departments D)

SELECT EmployeeID, FirstName+'  '+LastName AS NAME, (SELECT DepartmentName FROM Departments D
 WHERE E.DepartmentID = D.DepartmentID) department FROM Employees E ORDER BY department
 
 /* 14. Write a query to display the employee ID, first name, last names, salary of 
 all employees whose salary is above average for their departments.  */

 SELECT EmployeeID, FirstName FROM Employees AS A 
WHERE salary > (SELECT AVG(salary) FROM Employees WHERE DepartmentID = A.DepartmentID)

/* 15. Write a query to fetch even numbered records from employees table.  */

SELECT * FROM Employees WHERE EmployeeID %2=0

/* 16. Write a query to find the 5th maximum salary in the employees table.  */

SELECT DISTINCT Salary FROM Employees A WHERE 5 = (SELECT COUNT(DISTINCT salary) FROM Employees B WHERE B.Salary >= A.Salary)

/* 17. Write a query to find the 4th minimum salary in the employees table.  */

SELECT DISTINCT Salary FROM Employees A WHERE 4 = (SELECT COUNT(DISTINCT salary) FROM Employees B WHERE B.Salary <= A.Salary)

/* 18. Write a query to select last 10 records from a table. */

SELECT TOP(10)* FROM Employees ORDER BY EmployeeID DESC

/* 19. Write a query to list department number, name for all the departments in which there are no employees in the department. */ 

SELECT * FROM departments WHERE DepartmentID NOT IN (select DepartmentID FROM employees)

/* 20. Write a query to get 3 maximum salaries.  */

SELECT DISTINCT Salary,FirstName+' '+LastName AS Employee_Name FROM Employees A 
WHERE 3 >= (SELECT COUNT(DISTINCT Salary) FROM Employees B WHERE B.Salary >= A.Salary) ORDER BY A.Salary DESC


/* 21. Write a query to get 3 minimum salaries. */

SELECT DISTINCT Salary,FirstName+' '+LastName AS Employee_Name FROM Employees A 
WHERE 3 >= (SELECT COUNT(DISTINCT Salary) FROM Employees B WHERE B.Salary <= A.Salary) ORDER BY A.Salary DESC

-- SELECT TOP(3) EmployeeID, FirstName+'  '+LastName AS Employee_Name,Salary  FROM Employees ORDER BY Salary ASC

/* 22. Write a query to get nth max salaries of employees.  */

SELECT FirstName+' '+LastName AS Employee_Name, Salary  FROM Employees A WHERE (1) = (SELECT COUNT(DISTINCT(B.Salary)) 
FROM employees B WHERE B.Salary > A.Salary)
