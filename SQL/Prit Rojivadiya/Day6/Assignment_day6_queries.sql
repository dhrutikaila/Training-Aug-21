use Demo

-- Q1 Select employee details from employee table if data exists in incentive table ?

 SELECT * FROM Employee WHERE Emp_id IN (SELECT Emp_Ref_Id FROM Incentive)
 

 -- Q2 Find Salary of the employee whose salary is more than Roy Salary

 SELECT * FROM Employee WHERE Salary > (SELECT Salary FROM Employee WHERE First_Name = 'Roy')


 -- Q3 Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

use db2
SELECT Employees.EmployeeID, Employees.JobId, (SELECT DATEDIFF(DAY,StartDate,EndDate) FROM JobHistory WHERE Employees.DepartmentID = JobHistory.DepartmentID)"date_differnce"
FROM Employees WHERE DepartmentID = 90

SELECT j.EmployeeID,j.JobID,DATEDIFF(DAY,StartDate,EndDate) FROM JobHistory j WHERE DepartmentID = 90