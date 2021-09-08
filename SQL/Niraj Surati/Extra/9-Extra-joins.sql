USE Assignment2


--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

SELECT D.DepartmentName
	,	D.LocationID
	,	L.StreetAddress
	,	L.City
	,	L.StateProvince
	,	C.CountryName
FROM Departments AS D
INNER JOIN Locations AS L 
	ON D.LocationID = L.LocationID
INNER JOIN Countries AS C
	ON L.CountryID = C.CountryID

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 

SELECT CONCAT(E.FirstName,SPACE(1),E.LastName) AS 'Full Name'
	,	D.DepartmentID
	,	D.DepartmentName
FROM Employees AS E
INNER JOIN Departments AS D
	ON E.DepartmentID = D.DepartmentID

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

SELECT CONCAT(E.FirstName,SPACE(1),E.LastName) AS 'Full Name'
	,	E.JobId
	,	D.DepartmentID
	,	D.DepartmentName
FROM Employees AS E
INNER JOIN Departments AS D
	ON E.DepartmentID = D.DepartmentID
INNER JOIN Locations AS L
	ON D.LocationID = L.LocationID
WHERE L.City = 'London'

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

SELECT Emp.EmployeeID
	,	Emp.LastName
	,	Mgr.EmployeeID
	,	Mgr.LastName
FROM Employees AS Emp
INNER JOIN Employees AS Mgr
	ON Emp.ManagerID = Mgr.EmployeeID

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

SELECT E1.EmployeeID
	,	CONCAT(E1.FirstName,SPACE(1),E1.LastName) AS 'Full Name'
	,	E1.HireDate
FROM Employees AS E1
INNER JOIN Employees AS E2
	ON E1.HireDate > E2.HireDate
WHERE E2.LastName = 'Jones'

--6. Write a query to get the department name and number of employees in the department. 

SELECT D.DepartmentName
	,	COUNT(E.EmployeeID) AS 'Total Employees'
FROM Departments AS D
LEFT JOIN  Employees AS E
	ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

SELECT E.EmployeeID
	,	E.JobId
	,	JH.StartDate
	,	JH.EndDate
	,	DATEDIFF(DD, JH.StartDate, JH.EndDate) AS 'Difference In Day'
FROM JobHistory AS JH
INNER JOIN Employees AS E
	ON JH.EmployeeID = E.EmployeeID
WHERE JH.DepartmentID = 90 



--8. Write a query to display the department ID, department name and manager first name. 

SELECT D.DepartmentID
	,	D.DepartmentName
	,	E.FirstName
FROM Departments AS D
INNER JOIN Employees AS E
	ON D.ManagerID = E.EmployeeID

--9. Write a query to display the department name, manager name, and city. 

SELECT D.DepartmentID
	,	D.DepartmentName
	,	CONCAT(E.FirstName,SPACE(1),E.LastName) AS 'Full Name'
	,	L.City
FROM Departments AS D
INNER JOIN Employees AS E
	ON D.ManagerID = E.EmployeeID
INNER JOIN Locations AS L
	ON D.LocationID = L.LocationID 

--10. Write a query to display the job title and average salary of employees. 

SELECT 	JobId
	,	CONVERT(DECIMAL(10,2),AVG(Salary)) AS 'AVG Salary'
FROM Employees
GROUP BY JobId

--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

SELECT E1.JobId
	,	CONCAT(E1.FirstName,SPACE(1),E1.LastName) AS 'Full Name'	
	,	E1.Salary
	,	E1.Salary - (SELECT MIN(E2.Salary)
					FROM Employees AS E2
					WHERE E1.JobId = E2.JobId
					GROUP BY E2.JobId		
					)  AS 'Difference'
FROM Employees AS E1
--JOIN Employees AS E2
--	ON E1.JobId = E2.JobId

SELECT E1.JobId
	,	CONCAT(E1.FirstName,SPACE(1),E1.LastName) AS 'Full Name'	
	,	E1.Salary
	,	E1.Salary - MIN(E2.Salary) AS 'Difference'
FROM Employees AS E1
INNER JOIN Employees AS E2 
	ON E1.JobId = E2.JobId
GROUP BY E2.JobId, E2.Salary, E1.JobId, E1.FirstName, E1.LastName, E1.Salary

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

SELECT	JH.EmployeeID 
	,	JH.JobID
	,	CONCAT(E.FirstName,SPACE(1),E.LastName) AS 'Full Name'
	,	E.Salary
	,	JH.StartDate
	,	JH.EndDate
FROM JobHistory AS JH
JOIN Employees E
	ON JH.EmployeeID = E.EmployeeID
WHERE E.Salary > 10000

--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 

SELECT D.DepartmentID
	,	D.DepartmentName
	,	CONCAT(E.FirstName,SPACE(1),E.LastName) AS 'Full Name'
	,	E.HireDate
	,	E.Salary
FROM Departments AS D
JOIN Employees AS E
	ON D.ManagerID = E.EmployeeID
WHERE DATEDIFF(YYYY,E.HireDate,GETDATE()) > 15

