
--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

CREATE VIEW  Addresses
AS
SELECT Dept.DepartmentName 
	,	Loca.LocationID
	,	Loca.StreetAddress
	,	Loca.City
	,	Loca.StateProvince
	,	Con.CountryName
FROM Department AS Dept
JOIN Location AS Loca
ON Dept.LocationID = Loca.LocationID
JOIN Countries AS Con
ON Loca.CountryID= Con.CountryID

SELECT * 
FROM Addresses

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees.

CREATE VIEW Names_employees
AS 
SELECT CONCAT(FirstName,SPACE(1),Lastname) AS 'Full Name'
	,	Emp.DepartmentID
	,	Dept.DepartmentName
FROM Employee AS Emp
JOIN Department AS Dept
ON Emp.DepartmentID = Dept.DepartmentID

SELECT *
FROM Names_employees

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

CREATE VIEW London
AS 
SELECT CONCAT(FirstName,SPACE(1),Lastname) AS 'Full Name'
	,	Emp.DepartmentID
	,	Dept.DepartmentName
FROM Employee AS Emp
JOIN Department AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
JOIN Location AS Loca
ON Dept.LocationID = Loca.LocationID
WHERE Loca.City = 'London'

SELECT * 
FROM London

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

CREATE VIEW manager_name
AS
SELECT Emp1.EmployeeID
	,	CONCAT(Emp1.FirstName,SPACE(1),Emp1.Lastname) AS 'Employee Name'
	,	Emp2.ManagerID
	,	CONCAT(Emp2.FirstName,SPACE(1),Emp2.Lastname) AS 'Manager Name'
FROM Employee AS Emp1
LEFT JOIN Employee AS Emp2
ON Emp1.ManagerID = Emp2.EmployeeID

SELECT * 
FROM manager_name

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

CREATE VIEW hire_date
AS
SELECT CONCAT(FirstName,SPACE(1),Lastname) AS 'Employee Name'
	, HireDate
FROM Employee 
WHERE HireDate > (
	SELECT HireDate
	FROM Employee
	WHERE LastName = 'Jones'
)

SELECT *
FROM hire_date

--6. Write a query to get the department name and number of employees in the department. 

CREATE VIEW emp_total
AS
SELECT Dept.DepartmentName
	,	COUNT(Emp.EmployeeID) AS 'Total Employees'
FROM Employee AS EMP
RIGHT JOIN Department AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName

SELECT * FROM emp_total

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

SELECT * FROM JobHistory

CREATE VIEW job_history
AS
SELECT EmployeeID
	,	JobId
	,	DATEDIFF(dd, StartDate, EndDate) AS 'Difference In Days'
FROM JobHistorys
WHERE DepartmentID = 90

SELECT *
FROM job_history
SP_HELPTEXT job_history

--8. Write a query to display the department ID, department name and manager first name. 

CREATE VIEW dpt_mgr
AS
SELECT Dept.DepartmentID
	,	Dept.DepartmentName
	,	Emp.FirstName AS 'Manager'
FROM Department AS Dept
LEFT JOIN Employee AS Emp
ON Dept.ManagerID = Emp.EmployeeID

SELECT *
FROM dpt_mgr

--9. Write a query to display the department name, manager name, and city. 

CREATE VIEW dpt_loc_city
AS
SELECT Dept.DepartmentID
	,	Dept.DepartmentName
	,	Emp.FirstName AS 'Manager'
	,	Loca.City
FROM Department AS Dept
LEFT JOIN Employee AS Emp
ON Dept.ManagerID = Emp.EmployeeID
LEFT JOIN Location AS Loca
On Dept.LocationID = Loca.LocationID

SELECT *
FROM dpt_loc_city

--10. Write a query to display the job title and average salary of employees.

CREATE VIEW avg_salary
AS
SELECT JobId
	,	AVG(Salary) AS 'Average Salary'
FROM Employee
GROUP BY JobId

SELECT *
FROM avg_salary

--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

CREATE VIEW diff_sal_emp
AS
SELECT Emp.JobId
	,	CONCAT(FirstName,SPACE(1),Lastname) AS 'Employee Name'
	,	(Salary -
		(SELECT MIN(Salary)
		FROM Employee 
		WHERE JobId = Emp.JobId	
		)) AS 'Salary Differnece'
	,	Salary
	,	(SELECT MIN(Salary)
		FROM Employee
		WHERE JobId = Emp.JobId	
		) AS 'Min'
FROM Employee AS Emp

SELECT *
FROM diff_sal_emp

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

CREATE VIEW sal_emp_his
AS
SELECT *
FROM JobHistorys AS JH
WHERE EmployeeID IN (
	SELECT EmployeeID 
	FROM Employee
	WHERE EmployeeID = JH.EmployeeID
	AND Salary > 10000
)

SELECT *
FROM sal_emp_his

--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 

CREATE VIEW emp_mgr_2
AS
SELECT Dept.DepartmentName
	,	CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) AS 'Manager Name'
	,	Emp.HireDate
	,	Emp.Salary
FROM Department AS Dept
JOIN Employee AS Emp
ON Dept.ManagerID =  Emp.EmployeeID
WHERE DATEDIFF(yyyy,Emp.HireDate,GETDATE()) > 15

SELECT * FROM emp_mgr_2
