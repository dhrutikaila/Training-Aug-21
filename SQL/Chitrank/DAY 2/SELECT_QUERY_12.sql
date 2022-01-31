/*
Write a query to get the EmployeeID, names (FirstName, LastName), salary in 
ascending order of salary.
*/

SELECT EmployeeId,'Names' = FirstName + ' ' + LastName,Salary FROM Employees ORDER BY Salary