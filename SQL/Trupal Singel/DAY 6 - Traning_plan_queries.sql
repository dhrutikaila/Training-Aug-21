Use Tsql

/* 1. Select employee details from employee table if data exists in incentive table ? */

SELECT * FROM Employees WHERE exists (SELECT * FROM Incentives)

/* 2. Find Salary of the employee whose salary is more than Roy Salary. */

SELECT FirstName+'  '+LastName AS FULL_NAME, Salary  FROM Employees WHERE Salary >
(SELECT Salary FROM Employees WHERE FirstName='Roy')

/* 3. Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount  */

create view newquery as
SELECT E.FIRST_NAME+''+E.LAST_NAME AS NAME, E.SALARY,E.JOINING_DATE, I.INCENTIVE_DATE, I.INCENTIVE_AMOUNT FROM 
Employe E JOIN Incentives I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID

/* 4. Create a view to select Select first_name, incentive amount from employee and incentives table for those 
employees who have incentives and incentive amount greater than 3000 */

CREATE VIEW Q4 AS 
SELECT  E.FIRST_NAME+' '+E.LAST_NAME AS NAME,I.INCENTIVE_AMOUNT,SALARY FROM Employe E JOIN 
Incentives I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID WHERE I.INCENTIVE_AMOUNT > 3000 AND E.SALARY>3000


----- tables from sql supported files -----

/* Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London */

CREATE VIEW Q1 AS
SELECT  E.FirstName+' '+E.LastName AS NAME,E.JobId,E.DepartmentID,D.DepartmentName FROM Employees E JOIN 
Departments D ON E.DepartmentID=D.DepartmentID WHERE LocationID=(SELECT LocationID FROM Locations WHERE City='LONDON')

SELECT  * FROM Q1

/* Create a View to get the department name and number of employees in the department. */

CREATE VIEW Q2 AS
SELECT D.DepartmentName,'Total Employees'=count(E.EmployeeID) FROM Employees E JOIN 
Departments D on E.DepartmentID=D.DepartmentID GROUP BY  D.DepartmentName

SELECT * FROM Q2

/* Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. */

select EmployeeID,Experience=DATEDIFF(yyyy,StartDate,EndDate),JobID from JobHistory where DepartmentID=90

/* Write a View to display the department name, manager name, and city. */

CREATE VIEW Q3 AS 
SELECT D.DepartmentName,'Manager_Name'=E.FirstName, L.City FROM Departments D JOIN 
Employees E on D.ManagerID = E.EmployeeID JOIN Locations L on D.LocationID = L.LocationID 

SELECT * FROM Q3

/* Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. */

CREATE VIEW Q5 AS
SELECT D.DepartmentName,E.FirstName+' '+E.LastName AS FULL_NAME, E.HireDate,E.Salary FROM Departments D
JOIN Employees E ON D.ManagerID = E.EmployeeID WHERE DATEDIFF(YEAR,HireDate,GETDATE()) > 15

SELECT * FROM Q5