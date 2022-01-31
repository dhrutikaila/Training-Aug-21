--Assignment
USE SampleTable

SELECT * FROM Incentive

--query 1
--Select employee details from employee table if data exists in incentive table ?
SELECT * FROM Employees
WHERE EmployeeID IN
	(SELECT EmployeeID FROM Incentive)

--query2
--Find Salary of the employee whose salary is more than Roy Salary
--coundnt find Roy in database so used Renske
SELECT EmployeeID ,FirstName ,Salary FROM Employees
WHERE Salary > (SELECT Salary FROM Employees 
				WHERE FirstName = 'Renske' )
