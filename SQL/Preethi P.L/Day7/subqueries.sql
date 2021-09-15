/*1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. */ 

SELECT CONCAT(FirstName," ",LastName) AS Name,Salary FROM employees WHERE Salary > (SELECT Salary FROM employees WHERE LastName='Bull');

/*2. Find the names (first_name, last_name) of all employees who works in the IT department. */

SELECT CONCAT(FirstName," ",LastName) AS Name FROM employees WHERE DepartmentID = (SELECT DepartmentID FROM departments WHERE DepartmentName = 'IT');

/*3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. */

SELECT CONCAT(FirstName," ",LastName) AS Name FROM employees WHERE ManagerID IN(SELECT ManagerID FROM departments WHERE LocationID IN(SELECT LocationID FROM locations WHERE CountryID = 'US'));

/*4. Find the names (first_name, last_name) of the employees who are managers. */

SELECT FirstName, LastName FROM employees WHERE EmployeeID IN(SELECT ManagerID FROM employees);

/*5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. */

SELECT FirstName,LastName,Salary FROM employees WHERE Salary > (SELECT AVG(Salary) FROM employees);

/*6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. */

SELECT FirstName,LastName,Salary,JobId FROM Employees WHERE Salary IN (SELECT MIN(Salary) FROM Employees GROUP BY JobId) GROUP BY JobId;

/*7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. */

SELECT FirstName,LastName,Salary FROM employees WHERE DepartmentID IN(SELECT DepartmentID FROM departments WHERE DepartmentName LIKE 'IT%') AND Salary > (SELECT AVG(Salary) FROM employees);

/*8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.*/

SELECT FirstName,LastName,Salary FROM employees WHERE Salary > (SELECT Salary FROM employees WHERE LastName = 'Bell');

/*9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. */

SELECT FirstName,LastName,Salary FROM employees WHERE Salary = (SELECT MIN(Salary) FROM employees);

/*10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. */ 

SELECT FirstName,LastName,Salary FROM employees WHERE Salary > ALL(SELECT AVG(Salary) FROM employees GROUP BY DepartmentID);

/*11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. */

SELECT FirstName,LastName,Salary FROM employees WHERE Salary > ALL(SELECT Salary FROM employees WHERE JobId = 'SH_CLERK') ORDER BY Salary ASC;

/*12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. */ 

SELECT e1.FirstName,e1.LastName FROM employees e1 WHERE NOT EXISTS(SELECT * FROM employees e2 WHERE e2.ManagerID = e1.EmployeeID );

/*13. Write a query to display the employee ID, first name, last names, and department names of all employees.*/ 

SELECT EmployeeID,FirstName,LastName,(SELECT DepartmentName FROM departments d WHERE d.DepartmentID = e.DepartmentID ) AS DepartmentName FROM employees e;

/*14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. */ 

SELECT EmployeeID,FirstName,LastName,Salary FROM employees e WHERE Salary > (SELECT AVG(Salary) FROM employees WHERE DepartmentID = e.DepartmentID);

/*15. Write a query to fetch even numbered records from employees table. */

SELECT * FROM (SELECT (ROW_NUMBER() OVER(ORDER BY EmployeeID)) AS SrNo,EmployeeID FROM employees)temp WHERE MOD(SrNo,2) = 0

/*16. Write a query to find the 5th maximum salary in the employees table.*/ 
SELECT DISTINCT Salary FROM employees e1 WHERE 5 = (SELECT COUNT(DISTINCT Salary) FROM employees e2 WHERE e2.Salary >= e1.Salary);

/*17. Write a query to find the 4th minimum salary in the employees table.*/

SELECT DISTINCT Salary FROM employees e1 WHERE 4 = (SELECT COUNT(DISTINCT Salary) FROM employees  e2 WHERE e2.Salary <= e1.Salary);

/*18. Write a query to select last 10 records from a table.*/ 

SELECT * FROM (SELECT * FROM employees ORDER BY EmployeeID DESC LIMIT 10)last ORDER BY EmployeeID ASC;

/*19. Write a query to list department number, name for all the departments in which there are no employees in the department. */

SELECT DepartmentID, DepartmentName FROM departments WHERE DepartmentID NOT IN (SELECT DepartmentID FROM employees);

/*20. Write a query to get 3 maximum salaries.*/

SELECT DISTINCT Salary FROM employees e1 WHERE 3 >= (SELECT COUNT(DISTINCT Salary) FROM employees e2 WHERE e2.Salary >= e1.Salary) ORDER BY e1.Salary DESC;

SELECT DISTINCT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS rank, Salary FROM employees)temp WHERE rank<=3;

/*21. Write a query to get 3 minimum salaries.*/

SELECT DISTINCT Salary FROM employees e1 WHERE  3 >= (SELECT COUNT(DISTINCT Salary) FROM employees e2 WHERE e2.Salary <= e1.Salary) ORDER BY e1.Salary ASC;

SELECT DISTINCT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary ASC) AS rank, Salary FROM employees)temp WHERE rank<=3;


/*22. Write a query to get nth max salaries of employees.*/

SET @x = 4;
SELECT DISTINCT * FROM (SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS rank,Salary FROM employees)temp 
WHERE rank <= @x;
