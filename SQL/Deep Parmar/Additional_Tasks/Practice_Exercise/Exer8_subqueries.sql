--Subqueries :-

--[1] Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'.

	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees WHERE Salary > (SELECT Salary FROM Employees WHERE LastName='Bull')

--[2] Find the names (first_name, last_name) of all employees who works in the IT department. 

	SELECT [Name]=(EMP.FirstName+' '+EMP.LastName) FROM Employees AS EMP WHERE EMP.DepartmentID IN (SELECT DP.DepartmentID FROM Departments AS DP WHERE DP.DepartmentName='IT')

--[3] Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
--Hint : Write single-row and multiple-row subqueries

	SELECT (FirstName+' '+LastName) AS [Name] FROM Employees WHERE ManagerID IN (SELECT EMP.EmployeeID FROM Employees AS EMP WHERE EMP.DepartmentID IN 
	(SELECT DPT.DepartmentID FROM Departments AS DPT WHERE DPT.LocationID IN (SELECT L.LocationID FROM Locations AS L WHERE L.CountryID='US')))

--[4] Find the names (first_name, last_name) of the employees who are managers. 

	SELECT (FirstName+' '+LastName) AS [Name] FROM Employees WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--[5] Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)

--[6] Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 

	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees WHERE Salary = (SELECT MIN(Salary) FROM Employees)

--[7] Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees) AND 
	DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%')

--[8] Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 
 
	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees WHERE Salary >(SELECT Salary FROM Employees WHERE LastName='Bell')

--[9] Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 

	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees WHERE Salary = (SELECT MIN(Salary) FROM Employees)

	--ANOTHER WAY:-
	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees
	WHERE Salary = (SELECT TOP(1) TMP.MIN_Salary FROM (SELECT MIN(Salary) AS MIN_Salary FROM Employees GROUP BY DepartmentID)TMP ORDER BY TMP.MIN_Salary)

--[10] Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 

	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees WHERE Salary > ALL (SELECT AVG(Salary) FROM Employees GROUP BY DepartmentID)

--[11] Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
--     Sort the results on salary from the lowest to highest. 

	SELECT [Name]=(FirstName+' '+LastName),Salary FROM Employees WHERE Salary > ALL (SELECT Salary FROM Employees WHERE JobId='SH_CLERK') ORDER BY Salary

--[12] Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

	SELECT [Name]=(FirstName+' '+LastName) FROM Employees AS A WHERE EmployeeID NOT IN (SELECT EMP.ManagerID FROM Employees AS EMP)

--[13] Write a query to display the employee ID, first name, last names, and department names of all employees. 

	SELECT EMP.EmployeeID, EMP.FirstName, EMP.LastName,(SELECT DP.DepartmentName FROM Departments AS DP WHERE EMP.DepartmentID = DP.DepartmentID) Department FROM Employees AS EMP

--[14] Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 

	SELECT EmployeeID,FirstName,LastName,Salary FROM Employees AS E WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID=E.DepartmentID)

--[15] Write a query to fetch even numbered records from employees table. 

	SELECT * FROM(SELECT ROW_NUMBER() OVER (ORDER BY EmployeeID) AS Number,* FROM Employees)TMP WHERE TMP.Number % 2 = 0	

--[16] Write a query to find the 5th maximum salary in the employees table. 

	SELECT DISTINCT Salary FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS Number,* FROM Employees)TMP WHERE TMP.Number = 5

	--ANOTHER WAY:-
	SELECT DISTINCT E1.Salary FROM Employees AS E1 WHERE 4 = (SELECT COUNT(DISTINCT Salary) FROM Employees AS E2 WHERE E2.Salary > E1.Salary)

--[17] Write a query to find the 4th minimum salary in the employees table. 

	SELECT DISTINCT Salary FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary) AS Number,* FROM Employees)TMP WHERE TMP.Number = 4

--[18] Write a query to select last 10 records from a table. 

	SELECT * FROM Employees AS E1 WHERE E1.EmployeeID IN (SELECT TOP(10) E2.EmployeeID FROM Employees AS E2 ORDER BY E2.EmployeeID DESC)ORDER BY  EmployeeID 

--[19] Write a query to list department number, name for all the departments in which there are no employees in the department. 

	SELECT DepartmentID,DepartmentName FROM Departments WHERE DepartmentID NOT IN (SELECT EMP.DepartmentID FROM Employees AS EMP)

--[20] Write a query to get 3 maximum salaries. 

	SELECT DISTINCT Salary FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS Number,* FROM Employees)TMP WHERE TMP.Number < 4

--[21] Write a query to get 3 minimum salaries. 

	SELECT DISTINCT Salary FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary) AS Number,* FROM Employees)TMP WHERE TMP.Number < 4

--[22] Write a query to get nth max salaries of employees. 

	DECLARE @N INT
	SET @N=n
	SELECT DISTINCT Salary FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary) AS Number,* FROM Employees)TMP WHERE TMP.Number = @N

	--ANOTHER WAY:-
	SELECT E1.Salary FROM Employees AS E1 WHERE @N-1 = (SELECT COUNT(DISTINCT Salary) FROM Employees AS E2 WHERE E2.Salary > E1.Salary)
