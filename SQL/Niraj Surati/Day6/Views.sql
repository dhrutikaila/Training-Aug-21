USE Assignment2

SELECT *
FROM Employees

SELECT *
FROM Departments

SELECT *
FROM Locations

SELECT * 
FROM Countries

--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

CREATE VIEW  vw_dept_loc_con
AS
SELECT Dept.DepartmentName 
	,	Loca.LocationID
	,	Loca.StreetAddress
	,	Loca.City
	,	Loca.StateProvince
	,	Con.CountryName
FROM Departments AS Dept
JOIN Locations AS Loca
ON Dept.LocationID = Loca.LocationID
JOIN Countries AS Con
ON Loca.CountryID= Con.CountryID

SELECT * 
FROM vw_dept_loc_con

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees.

CREATE VIEW vw_emp_dept
AS 
SELECT CONCAT(FirstName,SPACE(1),Lastname) AS 'Full Name'
	,	Emp.DepartmentID
	,	Dept.DepartmentName
FROM Employees AS Emp
JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID

SELECT *
FROM vw_emp_dept

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

CREATE VIEW vw_emp_dept_loca
AS 
SELECT CONCAT(FirstName,SPACE(1),Lastname) AS 'Full Name'
	,	Emp.DepartmentID
	,	Dept.DepartmentName
FROM Employees AS Emp
JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
JOIN Locations AS Loca
ON Dept.LocationID = Loca.LocationID
WHERE Loca.City = 'London'

SELECT * 
FROM vw_emp_dept_loca

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

CREATE VIEW vw_emp_mgr
AS
SELECT Emp1.EmployeeID
	,	CONCAT(Emp1.FirstName,SPACE(1),Emp1.Lastname) AS 'Employee Name'
	,	Emp2.ManagerID
	,	CONCAT(Emp2.FirstName,SPACE(1),Emp2.Lastname) AS 'Manager Name'
FROM Employees AS Emp1
LEFT JOIN Employees AS Emp2
ON Emp1.ManagerID = Emp2.EmployeeID

SELECT * 
FROM vw_emp_mgr

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

CREATE VIEW vw_emp_hire_date
AS
SELECT CONCAT(FirstName,SPACE(1),Lastname) AS 'Employee Name'
	, HireDate
FROM Employees 
WHERE HireDate > (
	SELECT HireDate
	FROM Employees
	WHERE LastName = 'Jones'
)

SELECT *
FROM vw_emp_hire_date

--6. Write a query to get the department name and number of employees in the department. 

CREATE VIEW vw_dept_emp_total
AS
SELECT Dept.DepartmentName
	,	COUNT(Emp.EmployeeID) AS 'Total Employees'
FROM Employees AS EMP
RIGHT JOIN Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName

SELECT *
FROM vw_dept_emp_total

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

SELECT * FROM JobHistory

CREATE VIEW vw_job_history
AS
SELECT EmployeeID
	,	JobId
	,	DATEDIFF(dd, StartDate, EndDate) AS 'Difference In Days'
FROM JobHistory
WHERE DepartmentID = 90

SELECT *
FROM vw_job_history

--8. Write a query to display the department ID, department name and manager first name. 

CREATE VIEW vw_dpt_emp_mgr
AS
SELECT Dept.DepartmentID
	,	Dept.DepartmentName
	,	Emp.FirstName AS 'Manager'
FROM Departments AS Dept
LEFT JOIN Employees AS Emp
ON Dept.ManagerID = Emp.EmployeeID

SELECT *
FROM vw_dpt_emp_mgr

--9. Write a query to display the department name, manager name, and city. 

CREATE VIEW vw_dpt_emp_loc_city
AS
SELECT Dept.DepartmentID
	,	Dept.DepartmentName
	,	Emp.FirstName AS 'Manager'
	,	Loca.City
FROM Departments AS Dept
LEFT JOIN Employees AS Emp
ON Dept.ManagerID = Emp.EmployeeID
LEFT JOIN Locations AS Loca
On Dept.LocationID = Loca.LocationID

SELECT *
FROM vw_dpt_emp_loc_city

--10. Write a query to display the job title and average salary of employees.

CREATE VIEW vw_avg_salary
AS
SELECT JobId
	,	AVG(Salary) AS 'Average Salary'
FROM Employees
GROUP BY JobId

SELECT *
FROM vw_avg_salary

--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

CREATE VIEW vw_diff_sal_emp
AS
SELECT Emp.JobId
	,	CONCAT(FirstName,SPACE(1),Lastname) AS 'Employee Name'
	,	(Salary -
		(SELECT MIN(Salary)
		FROM Employees 
		WHERE JobId = Emp.JobId	
		)) AS 'Salary Differnece'
	,	Salary
	,	(SELECT MIN(Salary)
		FROM Employees
		WHERE JobId = Emp.JobId	
		) AS 'Min'
FROM Employees AS Emp

SELECT *
FROM vw_diff_sal_emp

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

CREATE VIEW vw_sal_emp_his
AS
SELECT *
FROM JobHistory AS JH
WHERE EmployeeID IN (
	SELECT EmployeeID 
	FROM Employees
	WHERE EmployeeID = JH.EmployeeID
	AND Salary > 10000
)

SELECT *
FROM vw_sal_emp_his

--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 

CREATE VIEW vw_emp_dpt_mgr_2
AS
SELECT Dept.DepartmentName
	,	CONCAT(Emp.FirstName, SPACE(1), Emp.LastName) AS 'Manager Name'
	,	Emp.HireDate
	,	Emp.Salary
FROM Departments AS Dept
JOIN Employees AS Emp
ON Dept.ManagerID =  Emp.EmployeeID
WHERE DATEDIFF(yyyy,Emp.HireDate,GETDATE()) > 15

SELECT * FROM vw_emp_dpt_mgr_2

DROP VIEW vw_emp_dpt_mgr_2
