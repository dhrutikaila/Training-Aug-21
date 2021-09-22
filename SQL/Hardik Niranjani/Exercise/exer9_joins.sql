--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
SELECT CONCAT(l.LocationID,' ',l.StreetAddress,' ',l.City,' ',l.StateProvince,' ',l.CountryID) as [Address], d.DepartmentID
		 FROM Departments as d
		 JOIN Locations as l
		 ON d.LocationID = l.LocationID

--2. Write a query to find the names (first_name, last name), department ID and department name of all the employees.
SELECT e.FirstName, e.LastName, d.DepartmentID, d.DepartmentName 
		 FROM Employees as e
		 JOIN Departments as d
		 ON e.DepartmentID = d.DepartmentID


--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.
SELECT e.FirstName, e.LastName, e.JobId, d.DepartmentID, d.DepartmentName, l.City 
		 FROM Employees as e
		 JOIN Departments as d
		 ON e.DepartmentID = d.DepartmentID
		 JOIN Locations as l
		 ON l.LocationID = d.LocationID
		 WHERE l.City ='London'

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).
SELECT e1.EmployeeID, e1.LastName, e2.ManagerID as [Manager ID],e2.LastName as [Manager Name] 
		 FROM Employees as e1
		 JOIN Employees as e2
		 ON e1.ManagerID = e2.EmployeeID



--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.
SELECT CONCAT(e1.FirstName,' ', e2.LastName) as [Name], e1.HireDate 
		 FROM Employees as e1
		 JOIN Employees as e2
		 ON e1.HireDate = e2.HireDate
		 WHERE e1.HireDate >ALL (SELECT HireDate FROM Employees WHERE LastName = 'Jones')


--6. Write a query to get the department name and number of employees in the department.
SELECT d.DepartmentName, COUNT(e.EmployeeID) as [Numer of Employee]  
	     FROM Employees	as e
		 JOIN  Departments as d
		 ON e.DepartmentID = d.DepartmentID
		 GROUP BY d.DepartmentName
	     ORDER BY [Numer of Employee] DESC


--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeID, JobID as [Job Title], DATEDIFF(DAY, StartDate , EndDate) as [Days] 
		FROM  JobHistory
		WHERE DepartmentID = 90 


--8. Write a query to display the department ID, department name and manager first name.
SELECT d.DepartmentID, d.DepartmentName, e.FirstName, e.LastName
		 FROM Employees as e
		 JOIN Departments as d 
		 ON e.ManagerID = d.ManagerID


--9. Write a query to display the department name, manager name, and city.
SELECT dep.DepartmentName, emp.FirstName as [Manager Name], loc.City 
		 FROM Employees	as emp
		 JOIN Departments as dep
		 ON emp.ManagerID = dep.ManagerID
		 JOIN Locations as loc
		 ON loc.LocationID = dep.LocationID

--10. Write a query to display the job title and average salary of employees.
SELECT JobId, AVG(Salary) as [Avg Salary] 
			FROM Employees
			GROUP BY JobId


--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT JobId, CONCAT(FirstName,' ',LastName) as [Name], 
			  (Salary - (SELECT  AVG(Salary) FROM Employees )) as [Salary Difference] 
			  FROM Employees
			  ORDER BY [Salary Difference] DESC			  

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
SELECT j.EmployeeID,CONCAT(e.FirstName,' ',e.LastName) as [Name],j.StartDate,j.EndDate,j.JobID , e.Salary
		 FROM JobHistory as j
		 JOIN Employees as e
		 ON j.EmployeeID = e.EmployeeID
		 WHERE e.Salary > 10000


--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT d.DepartmentName, CONCAT(e.FirstName,' ',e.LastName) as [Name], e.HireDate, e.Salary,
	   DATEDIFF(YEAR, e.HireDate, GETDATE()) as [experience]
	   FROM Employees as e
	   JOIN Departments as d
	   ON e.ManagerID = d.ManagerID
	   WHERE DATEDIFF(YEAR, e.HireDate, GETDATE()) >15



