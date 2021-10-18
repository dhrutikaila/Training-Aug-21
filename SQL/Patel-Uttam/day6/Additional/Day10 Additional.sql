USE PracticeExercise


-- Value functions 

-- Last_Value()
-- Frist_Value()
-- Lead()



-- Last_Value() : Last_Value() is Function that returns the last value from ordered set
			--		OVER clouse  is use with Last_Value()
			

	-- SELECT employees have join last in each department.
		
		SELECT FirstName , HireDate , Salary ,DepartmentID ,LAST_VALUE(HireDate) OVER ( ORDER BY DepartmentID ASC) FROM Employees


	-- SELECT employee in each department has join last from same salary employees.
		SELECT FirstName , HireDate, Salary ,DepartmentID , LAST_VALUE(HireDate) OVER (PARTITION BY DepartmentID ORDER BY Salary ASC) FROM Employees



-- First_Value() : First_Value() is Function simillar to Last_Value(), It returns the First value from ordered set
			--		OVER clouse  is use with First_Value()


	-- SELECT employees have join First in each department.
		
		SELECT FirstName , HireDate , Salary ,DepartmentID ,First_VALUE(HireDate) OVER ( ORDER BY DepartmentID ASC) FROM Employees


	-- SELECT employee in each department has join First from same salary employees.
		SELECT FirstName , HireDate, Salary ,DepartmentID , First_VALUE(HireDate) OVER (PARTITION BY DepartmentID ORDER BY Salary ASC) FROM Employees




-- Lead() : Lead() is function use to retrive subsequent row in result set without using self-join.
		-- it useful when we required to compare two rows of same column.


		-- compare salary of employee with first next employee (e.x 1 to 2)
		SELECT FirstName , HireDate, DepartmentID ,Salary , LEAD(Salary,1) OVER ( ORDER BY Salary ASC) AS 'Salary of next employee' FROM Employees WHERE DepartmentID = 50


		-- compare salary of employee with second next employee (e.x 1 to 3)
		SELECT FirstName , HireDate, DepartmentID ,Salary , LEAD(Salary,2) OVER ( ORDER BY Salary ASC) AS 'Salary of next employee' FROM Employees WHERE DepartmentID = 50
