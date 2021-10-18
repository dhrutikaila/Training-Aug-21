USE [Day6 (SELECT)]
GO


-- CHOOSE : this logic fuction is useful when we want to return any one column from (columns list)  as query result column in different scenario.

	-- syntax : CHOOSE(index of column want to return,[,columns])

	SELECT CHOOSE(1,FirstName,LastName) as 'Name' FROM Employees
	-- return FirstName

	SELECT CHOOSE(2,FirstName,LastName) as 'Name' FROM Employees
	-- return LastName



-- IIF : IIF is logic function , useful when we want to return one column From (Any Two Column) as query result column base on condition 
		-- In IIF , If conditionis true it return first column else if False return second column
		-- takes three parameter
		-- IIF (Condition, Column1 , Column2)

	SELECT IIF(Salary > 5000 ,FirstName + '>5000',LastName + '<5000') as 'Name' FROM Employees
	-- return FirstName when salary of employee is greater than 5000 and LastName for employees has Salary < 5000 

	SELECT IIF(DepartmentID < 60,FirstName + 'Depart>60',LastName+ 'Depart<60') as 'Name' FROM Employees
	-- return LastName
