USE PracticeExercise

--Ranking Fucntion : This function use to arange the output table in ranking based on purticular column
--					 over and order by use with Ranking functions.
	--1.Rank()
	--2.DENSE_rank()
	--3.Row_Number()
	--4.NTILE(x) (Self Learn)



--[Rank()] : Rank Function is returns the ranking based on order by and 
--			after multiple same rank , Rank() Function give the Actual possition number as Rank to next Row. 



SELECT RANK() over(ORDER BY Salary DESC)as 'Rank' , Salary FROM Employees 


SELECT RANK() over(ORDER BY Salary DESC)as 'Rank'  , Salary FROM Employees Where DepartmentID BETWEEN 90 AND 120


SELECT RANK() over(ORDER BY Salary DESC) as 'Rankk' , DepartmentID ,Salary FROM Employees GROUP BY DepartmentID , Salary


SELECT * FROM  (SELECT RANK() over(ORDER BY Salary DESC) as 'Rankk' , DepartmentID ,Salary FROM Employees GROUP BY DepartmentID , Salary)
tb1 WHERE Rankk = 10






--[DENSE_rank()] : DENSE_rank() Function is returns the ranking based on order by and 
--		   after multiple same rank , DENSE_rank() Function give the Rank as per rank sequence to next Row.


SELECT DENSE_rank() over(ORDER BY Salary DESC)as 'D_Rank', Salary , JobId FROM dbo.Employees


SELECT DENSE_rank() over(ORDER BY JobId )as 'D_Rank'  , Salary FROM Employees Where DepartmentID BETWEEN 20 AND 110


SELECT DENSE_rank() over(ORDER BY Salary DESC ) as 'D_Rankk' , JobId ,Salary FROM Employees GROUP BY JobId , Salary



-------------------------------------------------------------------------------------------------------------------------------------
--[derived table]
-- table genrate as ouput of query result
-- employee with second highest salary 

SELECT * FROM  (SELECT DENSE_rank() over(ORDER BY Salary DESC) as 'D_Rankk' , DepartmentID, JobId ,Salary FROM Employees GROUP BY DepartmentID , JobId , Salary)
tb1 WHERE D_Rankk = 10

------------------------------------------------------------------------------------------------------------------------------------------

 


--[ROW_NUMBER()] : It just return row number of result data


SELECT ROW_NUMBER() OVER(ORDER BY Salary ASC) as 'RowNumber', Salary FROM Employees







--Aggregate Fucntion : This function use to perform calulation on column values.
--						Mostly aggregation function with SELECT and GROUP BY clause/Statement.
	--1.SUM()
	--2.COUNT()
	--3.MIN()
	--4.MAX() 
	--5.AVG()



-- [SUM()] : this function return single value , total of column as result , it ignore NULL value.

	-- before assign NUll 
SELECT SUM(Salary) FROM Employees

UPDATE Employees SET Salary = NULL WHERE EmployeeID=101

-- after assign NUll 
SELECT SUM(Salary) FROM Employees 

-- reset the change 
UPDATE Employees SET Salary = 17000.00 WHERE EmployeeID=101







-- [COUNT()] : this function return single value , total number of values in column as result , it ignore NULL value.

SELECT COUNT(Salary) FROM Employees

UPDATE Employees SET Salary = NULL WHERE EmployeeID=101

-- after assign NUll 
SELECT COUNT(Salary) FROM Employees

-- reset the change 
UPDATE Employees SET Salary = 17000.00 WHERE EmployeeID=101






-- [AVG()] : this function return single value , average of values of column as result , it ignore  not Count NULL value in Numerator and denominator.

SELECT AVG(Salary) FROM Employees

UPDATE Employees SET Salary = NULL WHERE EmployeeID=101

-- after assign NUll 
SELECT AVG(Salary) FROM Employees -- (total of 106 value)/106 

-- reset the change 
UPDATE Employees SET Salary = 17000.00 WHERE EmployeeID=101






-- [MAX()] : this function return single value , MAXIMUM/biggest values of column as result.

SELECT MAX(Salary) FROM Employees




-- [MIN()] : this function return single value , MINIMUM/Smallest values of column as result.

SELECT MAX(Salary) FROM Employees







-- GROUP BY and HAVING 



-- [GROUP BY] : This clause of SELECT statement is use to divine table data in group on respect of one Column value or more than one column values.
--            Column for this clause can be column , non-aggregate calulation column , derived column and view.
--			  Column expression can be  ( ' column ', ' column1 , column2 ', ' column1+column2 ' )


-- it shows number of jobID based on DepartmentId 
SELECT COUNT(JobId) , DepartmentID FROM Employees GROUP BY DepartmentID

-- it shows average salary based on DepartmentId
SELECT COUNT(FirstName) as'Number of employee ', DepartmentID , JobId FROM Employees GROUP BY DepartmentID , JobId







-- [HAVING] : This clause of SELECT statement is use to Specifies a search condition for group or aggregate , 
--			with HAVING clause we can optimize search condition of group or we can search more specific data.
--			Aggregate Function use with HAVING.

-- it shows number of jobID has count more then 1 and 3 based on DepartmentID 
SELECT COUNT(JobId) , DepartmentID FROM Employees GROUP BY DepartmentID HAVING COUNT(JobId) > 1

SELECT COUNT(JobId) , DepartmentID FROM Employees GROUP BY DepartmentID HAVING COUNT(JobId) > 3 


-- it shows average salary based on DepartmentId
SELECT AVG(Salary) , DepartmentID ,FirstName FROM Employees GROUP BY DepartmentID ,FirstName HAVING FirstName LIKE 'A%'







-- SELF LEARNING 
	
	-- NTILE(X)
	-- GROUP BY ROLLUP
	-- GROUP BY CUBE
	-- GROUP BY GROUPING SETS


-- [NTILE(X)] : Purpose of NTILE is just to make GROUP of Result Data 
--			  it takes one argument for define number of group, thier is no logical purpose of NTILE is.


SELECT NTILE(107) OVER(ORDER BY Salary DESC) as 'Group number' , Salary FROM Employees



SELECT TOP 40 NTILE(10) OVER(ORDER BY Salary DESC) as 'Group number' , Salary FROM Employees





-- [GROUP BY ROLLUP] : Create  a group of each combination and also give one rollup of grand total.


-- it display all combination and grand total of that combination.
SELECT SUM(Salary) , DepartmentID ,JobId FROM Employees GROUP BY ROLLUP (DepartmentID  , JobId)




-- [GROUP BY CUBE] : Create  a group of all unique combination and  also give  rollup of grand total for individual combination and combine grand total of all combination.

SELECT SUM(Salary) , DepartmentID ,JobId FROM Employees GROUP BY CUBE (DepartmentID  , JobId)

-- below query give same as a above query

SELECT SUM(Salary) , DepartmentID ,JobId FROM Employees GROUP BY DepartmentID  , JobId WITH CUBE




-- [GROUP BY GROUPING SET] : It provides a ability to combine one or more than one GROUP BY Clause into one GROUP BY clause 



SELECT SUM(Salary), DepartmentID ,JobId FROM Employees GROUP BY GROUPING SETS (ROLLUP(DepartmentID  , JobId),CUBE(DepartmentID  , JobId))

-- above query is same as

SELECT SUM(Salary) ,DepartmentID ,JobId FROM Employees GROUP BY ROLLUP(DepartmentID  , JobId)
UNION ALL
SELECT SUM(Salary) ,DepartmentID ,JobId FROM Employees GROUP BY CUBE(DepartmentID  , JobId)
