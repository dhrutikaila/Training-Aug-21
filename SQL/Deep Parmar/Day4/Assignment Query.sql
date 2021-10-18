--Assignment

--[1] Write a query to rank employees based on their salary for a month

	--RANKING on their Lowest salary
	SELECT RANK() OVER (ORDER BY Salary) AS [Rank],* FROM Employees 

	--RANKING on their Highest salary
	SELECT RANK() OVER (ORDER BY Salary DESC) AS [Rank],* FROM Employees ORDER BY Salary DESC 

	--Another Ways:-		
		--SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS [RANK] ,Salary FROM Employees  
		--SELECT ROW_NUMBER() OVER (ORDER BY Salary) "Rank",* FROM Employees 
		--SELECT [RANK]= NTILE(107) OVER (ORDER BY Salary DESC),* FROM Employees ORDER BY Salary DESC

--[2] Select 4th Highest salary from employee table using ranking function

		SELECT * FROM (SELECT RANK() OVER (ORDER BY Salary DESC) AS [Rank],* FROM Employees)EMP WHERE [Rank]=4

--[3] Get department, total salary with respect to a department from employee table.

		SELECT DepartmentID,SUM(Salary) AS Total_Salary FROM Employees GROUP BY DepartmentID

--[4] Get department, total salary with respect to a department from employee table order by total salary descending

	SELECT DepartmentID,SUM(Salary) AS Total_Salary FROM Employees GROUP BY DepartmentID ORDER BY Total_Salary DESC

--[5] Get department wise maximum salary from employee table order by salary ascending

	SELECT DepartmentID,MAX(Salary) AS SALARY FROM Employees GROUP BY DepartmentID ORDER BY SALARY ASC

--[6] Get department wise minimum salary from employee table order by salary ascending

	SELECT DepartmentID,MIN(Salary) AS SALARY FROM Employees GROUP BY DepartmentID ORDER BY SALARY ASC

--[7] Select department, total salary with respect to a department from employee table 
--    where total salary greater than 50000 order by TotalSalary descending.

	SELECT DepartmentID,SUM(Salary) AS Total_Salary FROM Employees GROUP BY DepartmentID HAVING SUM(Salary)>50000 ORDER BY Total_Salary DESC