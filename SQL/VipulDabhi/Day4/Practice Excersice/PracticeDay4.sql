
--Rank Functions

SELECT EmployeeID,FirstName,Salary,ROW_NUMBER() OVER (ORDER BY Salary ASC) FROM Employees 
SELECT EmployeeID,FirstName,Salary,DENSE_RANK() OVER (ORDER BY Salary ASC) FROM Employees 
SELECT EmployeeID,FirstName,Salary,RANK() OVER (ORDER BY Salary ASC) FROM Employees 

 
--Aggregate Function

SELECT SUM(Salary) FROM Employees;
SELECT COUNT(Salary) FROM Employees;
SELECT AVG(Salary) FROM Employees;
SELECT MAX(Salary) FROM Employees;
SELECT MIN(Salary) FROM Employees;

--Group By Clause

SELECT DepartmentID,SUM(Salary) FROM Employees GROUP BY (DepartmentID);
SELECT DepartmentID,Salary,SUM(Salary) FROM Employees GROUP BY ROLLUP (DepartmentID,Salary);
SELECT DepartmentID,EmployeeID,COUNT(EmployeeID) FROM Employees GROUP BY CUBE (DepartmentID,EmployeeID) ORDER BY EmployeeID;
SELECT FirstName,Salary,COUNT(FirstName) FROM Employees GROUP BY GROUPING SETS ((FirstName),(Salary),(FirstName,Salary)) ORDER BY Firstname;                                        
SELECT EmployeeID,NTILE(5) OVER	(ORDER BY EmployeeID) FROM Employees
SELECT CountryID,NTILE(4)OVER( ORDER BY CountryID) FROM Countries

--Having Clause

SELECT DepartmentID,SUM(Salary) FROM Employees GROUP BY (DepartmentID) HAVING DepartmentID BETWEEN 0 AND 50;

