--- SELECT 2nd Highest salary FROM employee table using ranking function

    SELECT * FROM(SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) AS [drank], Salary
    FROM Employees)TMP WHERE(drank=2)


	SELECT * FROM(SELECT RANK() OVER (ORDER BY Salary DESC) AS [drank], Salary
    FROM Employees)TMP WHERE(drank=2)




	--- ROW_NUMBER()

    SELECT ROW_NUMBER() OVER (ORDER BY Salary DESC) AS [drank], Salary
    FROM Employees