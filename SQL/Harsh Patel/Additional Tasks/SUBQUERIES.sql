SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM JobHistory
SELECT * FROM Countries
SELECT * FROM Locations

--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 

		SELECT CONCAT(FirstName,SPACE(2),LastName),Salary FROM Employees
		WHERE Salary > (SELECT Salary FROM Employees WHERE LastName='Bull')
		
--2. Find the names (first_name, last_name) of all employees who works in the IT department. 

		SELECT CONCAT(FirstName,SPACE(2),LastName) FROM Employees WHERE
		DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 

--Hint : Write single-row and multiple-row subqueries
    
	SELECT CONCAT(FirstName,SPACE(1),Lastname) AS 'Full Name'
	FROM Employees
	WHERE ManagerID <> 0 AND
	ManagerID IN (
        SELECT ManagerID
        FROM Departments
        WHERE LocationID IN (
            SELECT LocationID
            FROM Locations
            WHERE CountryID = (
                SELECT CountryID
                FROM Countries
                WHERE CountryName LIKE 'United States %'
           )
    )
)
 


--4. Find the names (first_name, last_name) of the employees who are managers. 

		SELECT FirstName,LastName FROM Employees 
		WHERE EmployeeID IN (SELECT ManagerID FROM Employees WHERE ManagerID <>0) 
 

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

		SELECT CONCAT(FirstName,SPACE(2),LastName),Salary FROM Employees
		WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 

		SELECT CONCAT(FirstName,SPACE(2),LastName),Salary FROM Employees
		WHERE Salary =(SELECT MIN(Salary) FROM Employees)
	
--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

		SELECT CONCAT(FirstName,SPACE(2),LastName),Salary FROM Employees 
		WHERE Salary >(SELECT AVG(Salary) FROM Employees)
		AND DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

	

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 

		SELECT CONCAT(FirstName,SPACE(2),LastName),Salary FROM Employees 
		WHERE Salary >(SELECT Salary FROM Employees WHERE LastName='Bell')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 

		SELECT CONCAT(FirstName,SPACE(2),LastName),Salary FROM Employees
		WHERE Salary IN(SELECT MIN(Salary) FROM Employees)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 

		SELECT CONCAT(FirstName,SPACE(2),LastName),Salary FROM Employees WHERE Salary >(SELECT AVG(Salary) FROM Employees)

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 

		SELECT CONCAT(FirstName,SPACE(2),LastName),Salary FROM Employees
		WHERE Salary > ANY  (SELECT Salary FROM Employees WHERE JobId='SH_CLERK' ) ORDER BY Salary ASC

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

		SELECT CONCAT(FirstName, SPACE(1) ,LastName) 'Full Name' FROM Employees
        WHERE EmployeeID NOT IN (SELECT ManagerID FROM Employees)

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 

	SELECT e.EmployeeID,e.FirstName,e.LastName,d.DepartmentName FROM Employees e,Departments d 
	WHERE e.DepartmentID IN(SELECT d.DepartmentID FROM Departments)	

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 

	SELECT EmployeeID,FirstName,LastName,Salary FROM Employees
	WHERE Salary > ANY(SELECT AVG(Salary) FROM Employees GROUP BY DepartmentID)

--15. Write a query to fetch even numbered records from employees table. 
	
	SELECT * FROM (SELECT *,ROW_NUMBER() OVER (ORDER BY EmployeeID) AS RankNumber FROM Employees)a WHERE RankNumber%2=0

--16. Write a query to find the 5th maximum salary in the employees table. 

	SELECT Salary FROM(SELECT Salary,DENSE_RANK()OVER (ORDER BY SALARY DESC) AS RankNumber FROM Employees)a WHERE RankNumber=5 

--17. Write a query to find the 4th minimum salary in the employees table. 

	SELECT DISTINCT Salary FROM(SELECT Salary,DENSE_RANK()OVER (ORDER BY SALARY ASC) AS RankNumber FROM Employees)a WHERE RankNumber=4 

--18. Write a query to select last 10 records from a table. 

	SELECT * FROM(SELECT TOP 10 *,ROW_NUMBER() OVER (ORDER BY EmployeeID DESC) AS RankNumber FROM Employees)a
	ORDER BY RankNumber DESC

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 

	
	SELECT DepartmentID 'Department Number', DepartmentName FROM Departments
   WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)

--20. Write a query to get 3 maximum salaries. 

		SELECT TOP 3 Salary FROM (SELECT  DISTINCT Salary,DENSE_RANK()OVER (ORDER BY Salary DESC) AS RankNumber FROM Employees)a

--21. Write a query to get 3 minimum salaries. 

		SELECT TOP 3 Salary FROM (SELECT  DISTINCT Salary,DENSE_RANK()OVER (ORDER BY Salary ASC) AS RankNumber FROM Employees)a


--22. Write a query to get nth max salaries of employees. 

		SELECT Salary FROM (SELECT  DISTINCT Salary,DENSE_RANK()OVER (ORDER BY Salary ASC) AS RankNumber FROM Employees)a
		WHERE RankNumber=&n 
	