--USE JOINPRACTICE

--Select employee details from employee table if data exists in incentive table ?

SELECT * FROM Employee WHERE EXISTS (SELECT * FROM Incentives WHERE Employee.Employee_Id = Incentives.Employee_Ref_Id)

--Find Salary of the employee whose salary is more than Roy Salary

SELECT First_Name, Salary FROM Employee WHERE Salary > (SELECT Salary FROM Employee WHERE First_Name='Roy')


/*Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount*/

CREATE VIEW EmployeeDetail
	AS
		SELECT e.First_Name,e.Last_Name,e.Salary,e.Joining_Date,i.Incentive_Date,i.Incentive_Amount 
			FROM 
				Employee e JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id

SELECT *
	FROM
		EmployeeDetail

/*Create a view to select Select first_name, incentive amount from employee and incentives 
table for those employees who have incentives and incentive amount greater than 3000*/

CREATE VIEW EmployeeDetail2
	AS
		SELECT e.First_Name,i.Incentive_Amount 
			FROM 
				Employee e LEFT JOIN Incentives i ON e.Employee_Id=i.Employee_Ref_Id
SELECT * 
	FROM 
		EmployeeDetail2 
			WHERE Incentive_Amount IS NOT NULL 
				AND Incentive_Amount > 3000

--USE Sqlday2

/*Create a View to Find the names (first_name, last_name), job, department number, and 
department name of the employees who work in London*/

CREATE VIEW EmployeeDetail
	AS
		SELECT e.FirstName+' '+e.LastName AS EmployeeName,e.JobId,e.DepartmentID,d.DepartmentName,l.City
			FROM
				Employees e JOIN Departments d ON e.DepartmentID=d.DepartmentID
				JOIN Locations l ON l.LocationID=d.LocationID
SELECT *
	FROM 
		EmployeeDetail 
			WHERE City LIKE 'London'

/*Create a View to get the department name and number of employees in the department.*/

CREATE VIEW EmployeesInDepartment
	AS
		SELECT d.DepartmentName,e.EmployeeID
			FROM
				Employees e JOIN Departments d ON e.DepartmentID=d.DepartmentID
				
SELECT DepartmentName,COUNT(EmployeeID) AS NumberOfEmployees
	FROM
		EmployeesInDepartment
			GROUP BY DepartmentName

/*Find the employee ID, job title, number of days between ending date and starting date
for all jobs in department 90 from job history.*/

CREATE VIEW EmployeeHistory
	AS
		SELECT EmployeeID,JobID,StartDate,EndDate,DepartmentID
			FROM
				JobHistory
SELECT EmployeeID,JobID,DATEDIFF(DD,StartDate,EndDate) AS NoOfDays
	FROM
		EmployeeHistory
			WHERE DepartmentID=90

/*Write a View to display the department name, manager name, and city.*/

CREATE VIEW ManagerDetails
	AS
		SELECT DISTINCT d.DepartmentName,e1.FirstName+' '+e1.LastName AS ManagerName,l.City
			FROM
				Employees e1 JOIN Employees e2 ON e1.EmployeeID=e2.ManagerID
				JOIN Departments d ON e1.DepartmentID=d.DepartmentID
				JOIN Locations l ON l.LocationID=d.LocationID

SELECT *
	FROM
		ManagerDetails

/*Create a View to display department name, name (first_name, last_name), hire date,
salary of the manager for all managers whose experience is more than 15 years.*/

CREATE VIEW ManagerDetails2
	AS
		SELECT DISTINCT d.DepartmentName,e1.FirstName,e1.HireDate,e1.Salary 
			FROM 
				Employees e1 JOIN Employees e2 ON e1.EmployeeID=e2.ManagerID
				JOIN Departments d ON d.DepartmentID=e1.DepartmentID

SELECT *
	FROM
		ManagerDetails2
			WHERE DATEDIFF(YY,HireDate,GETDATE()) > 15