use db2

-- Q1 Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

SELECT d.DepartmentID,l.LocationID,l.StreetAddress,l.City,l.StateProvince,l.CountryID FROM Locations l
	JOIN Departments d ON d.LocationID = l.LocationID



-- Q2 Write a query to find the names (first_name, last name), department ID and name of all the employees.

SELECT e.FirstName,e.LastName,e.DepartmentID,d.DepartmentName FROM Employees e
	LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID



-- Q3 Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.

SELECT e.FirstName,e.LastName,e.JobId,e.DepartmentID,d.DepartmentName FROM Employees e
	join Departments d ON d.DepartmentID = e.DepartmentID
	JOIN Locations l ON l.LocationID = d.LocationID
WHERE l.City = 'London'



-- Q4 Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).

SELECT e.EmployeeID,e.LastName,m.EmployeeID,m.LastName FROM Employees e
	JOIN Employees m ON e.ManagerID = m.EmployeeID



-- Q5 Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.

SELECT e.FirstName,e.LastName,e.HireDate FROM Employees e
	JOIN Employees e1 ON e1.LastName = 'Jones'
WHERE e.HireDate > e1.HireDate



-- Q6 Write a query to get the department name and number of employees in the department.

SELECT d.DepartmentName,COUNT(e.EmployeeID) FROM Employees e
	JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName



-- Q7 Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

SELECT e.EmployeeID,e.JobId,DATEDIFF(Day,j.StartDate,j.EndDate) as 'Day' FROM JobHistory j
	JOIN Employees e ON j.EmployeeID = e.EmployeeID
WHERE j.DepartmentID = 90



-- Q8 Write a query to display the department ID, department name and manager first name.

SELECT d.DepartmentID,d.DepartmentName,d.ManagerID,e.FirstName FROM Departments d
	JOIN Employees e ON d.ManagerID = e.EmployeeID



-- Q9 Write a query to display the department name, manager name, and city.

SELECT d.DepartmentName,e.FirstName,l.City FROM Employees e 
	JOIN Departments d ON d.ManagerID = e.EmployeeID
	JOIN Locations L ON l.LocationID = d.LocationID



-- Q10 Write a query to display the job title and average salary of employees.

SELECT e.JobId,AVG(e.Salary) FROM JobHistory j
	JOIN Employees e ON j.JobID = e.JobId
GROUP BY e.JobId



-- Q11 Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.

SELECT e.JobId,e.FirstName,e.Salary - (SELECT MIN(Salary) FROM Employees WHERE JobId = e.JobId) FROM Employees e
	JOIN JobHistory j ON e.JobId = j.JobID


-- Q12 Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.

SELECT j.* FROM JobHistory j
	JOIN Employees e ON j.EmployeeID = e.EmployeeID
WHERE e.Salary > 10000



-- Q13 Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

SELECT d.DepartmentName,e.FirstName,e.LastName,e.HireDate,e.Salary,'YOE'=DATEDIFF(YEAR,e.HireDate,GETDATE()) FROM Departments d 
	JOIN Employees e ON d.ManagerID = e.EmployeeID
WHERE DATEDIFF(YEAR,e.HireDate,GETDATE()) > 15