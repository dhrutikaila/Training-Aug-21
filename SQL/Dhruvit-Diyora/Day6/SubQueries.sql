--task1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name',Salary FROM Employees WHERE Salary>(SELECT Salary from Employees WHERE LastName='Bull')

--task2. Find the names (first_name, last_name) of all employees who works in the IT department. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name' FROM Employees WHERE DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--task3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name' FROM Employees WHERE ManagerID IN (SELECT D.ManagerID FROM Departments D JOIN Locations L ON L.LocationID=D.LocationID WHERE L.CountryID='US' AND D.ManagerID!=0)

--task4. Find the names (first_name, last_name) of the employees who are managers. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name' FROM Employees WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--task5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name',Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--task6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 
SELECT CONCAT(E.FirstName, SPACE(1), E.LastName) AS 'Name', E.Salary, E.JobId FROM Employees E JOIN (SELECT MIN (Salary) AS Minimum_Salary, JobId FROM Employees GROUP BY JobId) temp ON E.JobId = temp.JobId WHERE E.Salary = temp.Minimum_Salary
--task7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name',Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees) AND DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--task8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name',Salary FROM Employees WHERE Salary > (SELECT Salary FROM Employees WHERE LastName='Bell')

--task9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT CONCAT(E.FirstName, SPACE(1), E.LastName) AS 'Name', E.Salary, E.DepartmentID FROM Employees E JOIN (SELECT MIN (Salary) AS Minimum_Salary, DepartmentID  FROM Employees GROUP BY DepartmentID) temp ON E.DepartmentID = temp.DepartmentID WHERE E.Salary = temp.Minimum_Salary

--task10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 
SELECT CONCAT(FirstName, SPACE(1), LastName) AS 'Name', Salary FROM Employees WHERE Salary > ALL (SELECT AVG (Salary) FROM Employees GROUP BY DepartmentID)

--task11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT CONCAT(E.FirstName, SPACE(1), E.LastName) AS 'Name', E.Salary, JobId FROM Employees E WHERE E.Salary > (SELECT MAX(Salary) FROM Employees WHERE JobId = 'SH_CLERK') ORDER BY E.Salary ASC

--task12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 
SELECT E.EmployeeID, CONCAT(E.FirstName, SPACE(1), E.LastName) AS 'Name' FROM Employees E WHERE E.EmployeeID NOT IN (SELECT DISTINCT (ManagerID) FROM Employees WHERE ManagerID != 0)

--task13. Write a query to display the employee ID, first name, last names, and department names of all employees. 
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentName FROM Employees E JOIN Departments D ON E.DepartmentID = D.DepartmentID

--task14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.
SELECT E.EmployeeID, E.FirstName, E.LastName, E.Salary FROM Employees E WHERE E.Salary > (SELECT AVG(S.Salary) FROM Employees S WHERE E.DepartmentID = S.DepartmentID)

--task15. Write a query to fetch even numbered records from employees table. 
SELECT * FROM Employees WHERE EmployeeID % 2 = 0

--task16. Write a query to find the 5th maximum salary in the employees table. 
SELECT DISTINCT(Salary) FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS 'Rank', Salary FROM Employees) temp WHERE Rank = 5

--task17. Write a query to find the 4th minimum salary in the employees table. 
SELECT DISTINCT(Salary) FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary ASC) AS 'SRank', Salary FROM Employees) temp WHERE SRank = 4

--task18. Write a query to select last 10 records from a table. 
SELECT * FROM (SELECT TOP (10) * FROM Employees ORDER BY EmployeeID DESC) temp ORDER BY EmployeeID ASC

--task19. Write a query to list department number, name for all the departments in which there are no employees in the department. 
SELECT D.DepartmentID, D.DepartmentName FROM Departments D WHERE D.DepartmentID NOT IN (SELECT DISTINCT(E.DepartmentID) FROM Employees E)

--task20. Write a query to get 3 maximum salaries. 
SELECT TOP (3) Salary FROM (SELECT DISTINCT(Salary) FROM Employees) temp ORDER BY Salary DESC


--task21. Write a query to get 3 minimum salaries. 
SELECT TOP (3) Salary FROM (SELECT DISTINCT(Salary) FROM Employees) temp ORDER BY Salary ASC

--task22. Write a query to get nth max salaries of employees. 
SELECT DISTINCT(Salary) FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS CRank, Salary FROM Employees) temp WHERE CRank = (100)


--Day6 Assignment queries
--task-1. Select employee details from employee table if data exists in incentive table ?
SELECT * 
FROM Employee 
WHERE Employee_ID IN (SELECT Employee_Ref_ID FROM Incentives)

--task-2. Find Salary of the employee whose salary is more than Roy Salary
SELECT Employee_ID, CONCAT(First_Name, SPACE(1), Last_Name) AS 'Name' , Salary 
FROM Employee 
WHERE Salary > (SELECT Salary FROM Employee WHERE First_Name = 'Roy')

--task-7-Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeID,JobID,DATEDIFF(DAY,StartDate,EndDate) AS 'Difference' FROM JobHistory WHERE DepartmentID=90