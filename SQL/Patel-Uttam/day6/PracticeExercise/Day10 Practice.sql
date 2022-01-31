USE [Day10 (Subquery)]


-- Practice Exercise
	-- Subquery
	-- Correlated subquery

 -- Subquery : Subquery simply refer as query within a query.
			--Basically subquery is use to break complex logic.
			--For complex logic subquery provide simplified query that is easy to readable.
			--(Some time join perform faster than subquery so, sql server rewrite subqueries as joins).
			


-- Select employee has Salary greater than average Salary

SELECT FirstName , Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees)



-- Select employee has equal salary as David Austin.

SELECT FirstName From Employees WHERE Salary = (SELECT Salary FROM Employees WHERE FirstName = 'David' AND LastName = 'Austin') AND FirstName != 'David' AND LastName != 'Austin'



-- Select employee has equal salary as David(FirstName only).

SELECT EmployeeID , FirstName From Employees WHERE Salary IN (SELECT Salary FROM Employees WHERE FirstName = 'David') AND FirstName != 'David'



-- Select employees has more salary than David . (>ALL)
 
SELECT EmployeeID , FirstName From Employees WHERE Salary >ALL (SELECT Salary FROM Employees WHERE FirstName = 'David') AND FirstName != 'David'



-- Select employees has more salary than David .(<ANY)

SELECT EmployeeID , FirstName From Employees WHERE Salary >ANY (SELECT Salary FROM Employees WHERE FirstName = 'David') AND FirstName != 'David'



-- Select employees has less salary than David . (>ALL)
 
SELECT EmployeeID , FirstName From Employees WHERE Salary <ALL (SELECT Salary FROM Employees WHERE FirstName = 'David') AND FirstName != 'David'



-- Select employees has less salary than David .(<ANY)

SELECT EmployeeID , FirstName From Employees WHERE Salary <ANY (SELECT Salary FROM Employees WHERE FirstName = 'David') AND FirstName != 'David'



-- Select department has same managerID as IT Support.

SELECT DepartmentName FROM Departments WHERE ManagerID = (SELECT ManagerID FROM Departments WHERE DepartmentName = 'IT Support')



-- Select Department Has more employee then department 110.

SELECT DepartmentID , COUNT(EmployeeID) AS 'Number of Employee' FROM Employees GROUP BY DepartmentID HAVING COUNT(EmployeeID) > (SELECT COUNT(EmployeeID) FROM Employees WHERE DepartmentID = 110)   







-- Correlated subquery : Correlated subquery is subquery which is depends on outer query , correlated subquery use value of outer query.
					--  As we know correlated subquery use value of outer query so, it execute repeatedly for each value of outer query.
					--  correlated subquery cannot execute independently.


 SELECT DepartmentName , (SELECT SUM(EmployeeID) as 'total emloyee' FROM Employees WHERE DepartmentID = Departments.DepartmentID) FROM Departments
