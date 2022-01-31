--1.Select employee details from employee table if data exists in incentive table ?
SELECT * FROM Employees WHERE EXISTS (SELECT * FROM Incentives)

--2.Find Salary of the employee whose salary is more than Roy Salary
SELECT * FROM Employees WHERE Salary > (SELECT Salary FROM Employees where FirstName='Roy'); 
 
--3.Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeID,JobId, enddate-startdate Days from Job_History INNER JOIN Jobs WHERE Department_Id= 90;

