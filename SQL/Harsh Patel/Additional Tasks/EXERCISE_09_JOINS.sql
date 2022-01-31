SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM JobHistory
SELECT * FROM Countries
SELECT * FROM Locations


--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

		SELECT l.LocationID,l.StreetAddress,l.City,l.StateProvince,c.CountryName FROM Locations l JOIN Countries c
		ON l.CountryID=c.CountryID JOIN Departments d ON l.LocationID=d.LocationID

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 
		
		SELECT e.FirstName,e.LastName,e.DepartmentID,d.DepartmentName FROM Employees e JOIN Departments d
		ON e.DepartmentID=d.DepartmentID

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

		SELECT e.FirstName,e.LastName,e.JobID AS JOB,e.DepartmentID AS Department_Number,d.DepartmentName
		FROM Employees e JOIN Departments d ON e.DepartmentID=d.DepartmentID JOIN Locations l ON l.LocationID=d.LocationID
		WHERE City='LONDON'


--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

	SELECT e.EmployeeID,e.LastName,e.ManagerID,CONCAT(m.FirstName,SPACE(2),m.LastName) FROM Employees e JOIN Employees m
	ON e.ManagerID=m.EmployeeID

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

	SELECT CONCAT(e1.FirstName,SPACE(2),e1.LastName) AS FullName,e1.HireDate FROM Employees e1 JOIN Employees e2
	ON e1.HireDate > e2.HireDate WHERE e2.LastName='Jones'

--6. Write a query to get the department name and number of employees in the department. 

	SELECT DISTINCT e.DepartmentID AS Depart_Number,d.DepartmentName AS Department_Name FROM Employees e JOIN Departments d
	ON e.DepartmentID=d.DepartmentID

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

	SELECT e.EmployeeID,e.JobID,DATEDIFF(dd,j.StartDate,j.EndDate) AS 'DAYS' FROM Employees e JOIN JobHistory j
	ON e.DepartmentID=j.DepartmentID WHERE e.DepartmentID=90

--8. Write a query to display the department ID, department name and manager first name. 

	SELECT e.FirstName,d.DepartmentName,e.DepartmentID FROM Employees e JOIN Departments d 
	ON e.EmployeeID=d.ManagerID
	
--9. Write a query to display the department name, manager name, and city. 

	SELECT D.DepartmentID,D.DepartmentName,CONCAT(E.FirstName,SPACE(1),E.LastName) AS 'Full Name', L.City
	FROM Departments AS D INNER JOIN Employees AS E ON D.ManagerID = E.EmployeeID JOIN Locations AS L
	ON D.LocationID = L.LocationID 	


--10. Write a query to display the job title and average salary of employees. 
	
	SELECT 	JobId,CONVERT(DECIMAL(10,2),AVG(Salary)) AS 'AVG Salary' FROM Employees
	GROUP BY JobId


--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
	SELECT E1.JobId, CONCAT(E1.FirstName,SPACE(1),E1.LastName) AS 'Full Name', E1.Salary,
	E1.Salary - (SELECT MIN(E2.Salary) FROM Employees AS E2 WHERE E1.JobId = E2.JobId
	GROUP BY E2.JobId)  AS 'Difference' FROM Employees AS E1
		
--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 


	SELECT	JH.EmployeeID , JH.JobID, CONCAT(E.FirstName,SPACE(1),E.LastName) AS 'Full Name', E.Salary
	, JH.StartDate, JH.EndDate FROM JobHistory AS JH JOIN Employees E ON JH.EmployeeID = E.EmployeeID
	WHERE E.Salary > 10000


--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 

		SELECT D.DepartmentID, D.DepartmentName, CONCAT(E.FirstName,SPACE(1),E.LastName) AS 'Full Name'
		, E.HireDate, E.Salary FROM Departments AS D JOIN Employees AS E ON D.ManagerID = E.EmployeeID
		WHERE DATEDIFF(YYYY,E.HireDate,GETDATE()) > 15