-- SubQueries.

-- 1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
Select (FirstName +' ' + LastName) As Full_Name, Salary 
from Employees 
where Salary >(Select Salary from Employees where LastName='Bull') 


-- 2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT FirstName , LastName 
FROM Employees 
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT')


-- 3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. Hint : Write single-row and multiple-row subqueries
SELECT FirstName+' '  + LastName 'NAME' FROM Employees
WHERE DepartmentID  IN(SELECT DepartmentID  
FROM Departments 
WHERE LocationID IN(SELECT LocationID FROM Locations WHERE CountryID='US'))


-- 4. Find the names (first_name, last_name) of the employees who are managers. 
SELECT FirstName+' '  + LastName 'NAME' 
FROM Employees
WHERE EmployeeID  IN(SELECT ManagerID  FROM Employees)


-- 5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT FirstName+' '  + LastName 'NAME',Salary 
FROM Employees
WHERE Salary >(SELECT AVG(Salary)  FROM Employees)


-- 6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT FirstName+' '  + LastName 'NAME',Salary 
FROM Employees 
WHERE Salary IN(SELECT MIN(Salary) 'Salary'  FROM Employees GROUP BY DepartmentID )


-- 7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
SELECT FirstName+' '  + LastName 'NAME',Salary 
FROM Employees 
WHERE Salary >(SELECT AVG(Salary)  FROM Employees)  
AND DepartmentID =(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')


-- 8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT FirstName+' '  + LastName 'NAME',Salary 
FROM Employees 
WHERE Salary >(SELECT Salary  FROM Employees WHERE LastName='Bell')


-- 9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT FirstName+' '  + LastName 'NAME',Salary 
FROM Employees 
WHERE Salary IN (SELECT MIN(Salary) 'Salary'  FROM Employees GROUP BY DepartmentID )


-- 10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT FirstName+' '  + LastName 'NAME',Salary 
FROM Employees 
WHERE Salary > (SELECT MAX(Salary) 'Salary'  FROM((SELECT AVG(Salary) 'Salary'  FROM Employees GROUP BY DepartmentID)new)


-- 11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT FirstName+' '  + LastName 'NAME',Salary 
FROM Employees 
WHERE Salary > (SELECT MAX(Salary)   FROM Employees WHERE JobId='SH_CLERK' GROUP BY JobId)
ORDER BY Salary


-- 12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
SELECT FirstName+' '  + LastName 'NAME' FROM Employees 
WHERE EmployeeID NOT IN (SELECT ManagerID   FROM Employees) 


-- 13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT e.EmployeeID, e.FirstName, e.LastName,d.DepartmentName 
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID


-- 14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 
SELECT e.EmployeeID,e.FirstName,e.LastName,e.Salary 
FROM Employees  e INNER JOIN (SELECT DepartmentID,AVG(Salary) 'Salary'  FROM Employees GROUP BY DepartmentID) new 
ON  e.Salary > new.Salary AND e.DepartmentID =new.DepartmentID
ORDER BY EmployeeID


-- 15. Write a query to fetch even numbered records from employees table. 
SELECT * FROM 
(SELECT ROW_NUMBER() OVER (ORDER BY EmployeeID) 'ROW_NUMBER',* FROM Employees) NEW
WHERE  ROW_NUMBER%2=0


-- 16. Write a query to find the 5th maximum salary in the employees table. 
SELECT Salary FROM 
(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) 'DNS_RANK' , Salary FROM Employees) NEW  
WHERE  DNS_RANK = 5


-- 17. Write a query to find the 4th minimum salary in the employees table. 
SELECT Salary FROM 
(SELECT DENSE_RANK() OVER (ORDER BY Salary) 'DNS_RANK' , Salary FROM Employees) NEW  
WHERE DNS_RANK = 4


-- 18. Write a query to select last 10 records from a table. 
SELECT TOP 10 * FROM Employees ORDER BY EmployeeID DESC


-- 19. Write a query to list department number, name for all the departments in which there are no employees in the department. 
SELECT DepartmentID,DepartmentName FROM Departments
WHERE DepartmentID NOT IN(SELECT DepartmentID FROM Employees)


-- 20. Write a query to get 3 maximum salaries. 
SELECT Salary FROM 
(SELECT  DENSE_RANK() OVER (ORDER BY Salary DESC) 'DNS_RANK', Salary FROM Employees)newtab  
WHERE  DNS_RANK BETWEEN 1 AND 3


-- 21. Write a query to get 3 minimum salaries. 
SELECT Salary FROM 
(SELECT  DENSE_RANK() OVER (ORDER BY Salary ) 'DNS_RANK',*  FROM Employees)newtab  
WHERE  DNS_RANK BETWEEN 1 AND 3


-- 22. Write a query to get nth max salaries of employees. 
DECLARE @N INT=5
SELECT Salary FROM 
(SELECT  DENSE_RANK() OVER (ORDER BY Salary DESC) 'DNS_RANK',* FROM Employees)newtab  
WHERE  DNS_RANK = @N
