--USE SqlDay2

/*1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) 
of all the departments. */

CREATE VIEW Addresses
	AS
		SELECT l.LocationID,l.StreetAddress,l.City,l.StateProvince,c.CountryName,d.DepartmentID,d.DepartmentName
			FROM 
				Countries c JOIN Locations l ON c.CountryID=l.CountryID
				JOIN Departments d ON d.LocationID=l.LocationID

SELECT * 
	FROM 
		Addresses

/*2. Write a query to find the names (first_name, last name), 
department ID and name of all the employees. */

CREATE VIEW EmpDept
	AS
		SELECT e.FirstName+' '+e.LastName AS EmployeeName,d.DepartmentID,d.DepartmentName
			FROM
				Employees e JOIN Departments d ON e.DepartmentID=d.DepartmentID

SELECT * 
	FROM
		EmpDept

/*3. Find the names (first_name, last_name), job, department number, 
and department name of the employees who work in London. */

CREATE VIEW EmployeeDetail2
	AS
		SELECT e.FirstName+' '+e.LastName AS EmployeeName,e.JobId,e.DepartmentID,d.DepartmentName,l.City
			FROM
				Employees e JOIN Departments d ON e.DepartmentID=d.DepartmentID
				JOIN Locations l ON l.LocationID=d.LocationID

SELECT *
	FROM 
		EmployeeDetail 
			WHERE City LIKE 'London'

/*4. Write a query to find the employee id, name (last_name) along with 
their manager_id, manager name (last_name). */

CREATE VIEW EmployeeWithManager
	AS
		SELECT e.EmployeeID AS EmployeeID,e.LastName AS EmployeeName ,m.EmployeeID AS ManagerID,m.LastName AS ManagerName 
			FROM 
				Employees m JOIN Employees e ON m.EmployeeID=e.ManagerID
				select * from Employees
SELECT *
	FROM
		EmployeeWithManager

/*5. Find the names (first_name, last_name) and hire date of the employees
who were hired after 'Jones'. */

CREATE VIEW EmployeeDetail3
	AS
		SELECT FirstName+' '+LastName AS EmployeeName,HireDate
			FROM
				Employees

SELECT * 
	FROM 
		EmployeeDetail3 
			WHERE HireDate > 
				(SELECT HireDate FROM Employees WHERE LastName='Jones')

/*6. Write a query to get the department name and number of employees in the department. */

CREATE VIEW EmployeesInDepartment2
	AS
		SELECT d.DepartmentName,e.EmployeeID
			FROM
				Employees e JOIN Departments d ON e.DepartmentID=d.DepartmentID
				
SELECT DepartmentName,COUNT(EmployeeID) AS NumberOfEmployees
	FROM
		EmployeesInDepartment
			GROUP BY DepartmentName

/*7. Find the employee ID, job title, number of days between ending date
and starting date for all jobs in department 90 from job history. */

CREATE VIEW EmployeeHistory2
	AS
		SELECT EmployeeID,JobID,StartDate,EndDate,DepartmentID
			FROM
				JobHistory

SELECT EmployeeID,JobID,DATEDIFF(DD,StartDate,EndDate) AS NoOfDays
	FROM
		EmployeeHistory
			WHERE DepartmentID=90

/*8. Write a query to display the department ID, department name and manager first name. */

CREATE VIEW DepartmentDetail
	AS
		SELECT d.DepartmentID,d.DepartmentName,e.FirstName AS ManagerName
			FROM Departments d JOIN Employees e ON d.ManagerID=e.EmployeeID
SELECT *
	FROM
		DepartmentDetail

/*9. Write a query to display the department name, manager name, and city. */

CREATE VIEW ManagerDetails3
	AS
		SELECT DISTINCT d.DepartmentName,e1.FirstName+' '+e1.LastName AS ManagerName,l.City
			FROM
				Employees e1 JOIN Employees e2 ON e1.EmployeeID=e2.ManagerID
				JOIN Departments d ON e1.DepartmentID=d.DepartmentID
				JOIN Locations l ON l.LocationID=d.LocationID

SELECT *
	FROM
		ManagerDetails3

/*10. Write a query to display the job title and average salary of employees. */

CREATE VIEW JobAvgSlry
	AS
		SELECT JobId,Salary
			FROM
				Employees

SELECT JobId AS JobTitle,AVG(Salary) AS AverageSalary
	FROM
		JobAvgSlry 
			GROUP BY JobId

/*11. Display job title, employee name, and the difference between salary of 
the employee and minimum salary for the job. */

CREATE VIEW MinsalaryOfJob
	AS
		SELECT JobId,MIN(Salary) AS MinSal
			FROM 
				Employees 
					GROUP BY JobId

SELECT e.EmployeeID,e.FirstName,e.JobId,(e.Salary-m.MinSal) AS SalaryDiff
	FROM Employees e JOIN MinsalaryOfJob m ON e.JobId=m.JobId

/*12. Write a query to display the job history that were done by any employee 
who is currently drawing more than 10000 of salary. */

CREATE VIEW EmployeeJobHistory
	AS
		SELECT j.*,e.Salary 
			FROM Employees e JOIN JobHistory j ON e.EmployeeID=j.EmployeeID

SELECT * 
	FROM 
		EmployeeJobHistory
			WHERE Salary>10000

/*13. Write a query to display department name, name (first_name, last_name), 
hire date, salary of the manager for all managers whose experience is more than 15 years. */

CREATE VIEW ManagerDetails4
	AS
		SELECT DISTINCT d.DepartmentName,e1.FirstName,e1.HireDate,e1.Salary 
			FROM 
				Employees e1 JOIN Employees e2 ON e1.EmployeeID=e2.ManagerID
				JOIN Departments d ON d.DepartmentID=e1.DepartmentID

SELECT *
	FROM
		ManagerDetails4
			WHERE DATEDIFF(YY,HireDate,GETDATE()) > 15