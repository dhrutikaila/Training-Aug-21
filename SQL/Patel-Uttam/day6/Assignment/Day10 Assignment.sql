USE [Day9 (JOIN)]

/*
Select employee details from employee table if data exists in incentive table ?

Find Salary of the employee whose salary is more than Roy Salary

Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
*/

--Assignment


-- Select employee details from employee table if data exists in incentive table ?

SELECT * FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM Incentive) -- (97 employee's details are in Incentive)


-- Find Salary of the employee whose salary is more than Roy Salary

SELECT EmployeeID , Salary FROM Employees WHERE Salary IN (SELECT Salary FROM Employees WHERE FirstName = 'Roy')



-- Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

SELECT employeeID, jobID , DATEDIFF(MM,StartDate,EndDate) as 'month of work' FROM JobHistory WHERE DepartmentID = 90