SELECT * FROM Employee
SELECT * FROM Incentives

SELECT * FROM JobHistory
SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations


--1)Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW TASK_1
AS
SELECT FirstName,LastName,Salary,JoiningDate,IncentiveDate IncentiveAmount 
FROM Employee E FULL OUTER JOIN Incentives I ON E.EmployeeId =I.EmployeeRefId

SELECT * FROM TASK_1
--2)Create a view to select Select first_name, incentive amount from employee and incentives table 
--  for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW TASK_2
AS 
SELECT FirstName, IncentiveAmount
FROM Incentives I LEFT JOIN Employee E ON I.EmployeeRefId=E.EmployeeId
WHERE IncentiveAmount >3000

SELECT * FROM TASK_2



--3)Create a View to Find the names (first_name, last_name), job, department number, 
--	and department name of the employees who work in London
CREATE VIEW TASK_3
AS
SELECT CONCAT(FirstName,' ',LastName) NAMES,JobId,E.DepartmentID,DepartmentName 
FROM Employees E INNER JOIN Departments D ON E.DepartmentID =D.DepartmentID
INNER JOIN Locations L ON D.LocationID=L.LocationID
WHERE City='LONDON'

SELECT * FROM TASK_3


--4)Create a View to get the department name and number of employees in the department.

CREATE VIEW TASK_4
AS
SELECT DepartmentName,COUNT(E.DepartmentID) 'NUMBER OF EMPLOYESS '
FROM Employees E LEFT JOIN Departments D 
ON E.DepartmentID= D.DepartmentID 
GROUP BY DepartmentName
SELECT * FROM TASK_4


--5)Find the employee ID, job title, number of days between ending date and starting date for all 
--	jobs in department 90 from job history.
CREATE VIEW TASK_5
AS
SELECT EmployeeID, JobID , DATEDIFF(DAY,StartDate,EndDate) AS 'NUMBER OF DAYS'
FROM JobHistory
WHERE DepartmentID=90
SELECT * FROM TASK_5


--6)Write a View to display the department name, manager name, and city.
CREATE VIEW TASK_6
AS
SELECT DepartmentName,CONCAT(E.FirstName,' ',E.LastName) 'MANAGERNAME',City
FROM Departments D INNER JOIN Employees E
ON D.ManagerID=E.EmployeeId 
INNER JOIN Locations L
ON D.LocationID=L.LocationID
SELECT * FROM TASK_6


--7)Create a View to display department name, name (first_name, last_name), hire date, 
--- salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW TASK_7
AS
SELECT DepartmentName ,CONCAT(FirstName,' ',LastName) Manager, HireDate, Salary
FROM Employees E INNER JOIN Departments D 
ON E.EmployeeID=D.ManagerID
WHERE DATEDIFF(YEAR,2021,E.HireDate)>15
SELECT * FROM TASK_7
