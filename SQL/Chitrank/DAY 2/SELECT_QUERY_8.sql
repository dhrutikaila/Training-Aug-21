/*
Write a query to get the names (FirstName, LastName), Salary, PF of all the 
Employees (PF is calculated as 12% of salary).
*/

SELECT FirstName,LastName,Salary,PF=(0.12*Salary) FROM Employees