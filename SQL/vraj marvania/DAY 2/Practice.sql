-->DML
--->SELECT
   --The following query finds the first name and last name of all customers:
	   SELECT FirstName,LastName
	   FROM employees

   --SELECT � retrieve all columns from a table example
       SELECT *
	   FROM employees

   --SELECT � sort the result set
      SELECT * FROM employees WHERE JobId = 'IT_PROG'

--INSERT
  --INSERT SINGLE ROW 
      INSERT INTO EmployeeS 
      VALUES (207,'aa','King','SKINGG','515.123.4567','1987-06-17','AD_PRES',91125.00,0.00,0,90)

  --INSERT Multtiple Row
      INSERT INTO EmployeeS 
      VALUES (208,'aa','King','SKINGGR','515.123.4567','1987-06-17','AD_PRES',91125.00,0.00,0,90),
	         (209,'aa','Kochhar','NKOCHHARR','515.123.4568','1987-06-18','AD_VP',0.03,0.00,100,90)

--UPDATE
  --UPDATE ALL ROW
     UPDATE EmployeeS
	 SET FirstName = 'shivang'  

  --UPDATE SPECIFIC ROW
      UPDATE EmployeeS
	  SET FirstName = 'shivang'  
	  WHERE EmployeeID='101'


--DELETE
  --Delete the number of random rows example
    DELETE FROM Person.Password

  --removes 10 random rows
    DELETE TOP(10) 
	FROM Person.Password

  --removes top 5% row
	DELETE TOP (5) PERCENT
    FROM Person.Password

 
--Literals & Concatenate
  SELECT FirstName+' '+LastName AS [FULLNAME] 
  FROM Employees

  SELECT 'NAME :'+'KARAN'


--Calculating Column Values
	 --(+) INC SALARY BY 200
	 SELECT Salary+200 
	 FROM  Employees

	 --(-) DESC SALARY BY 200
	 SELECT Salary-200 
	 FROM  Employees

	 --(/)
	  SELECT Salary/2 
	  FROM  Employees

	 --(*)INC 0.5 SALARY
	  SELECT Salary*.5 
	  FROM  Employees

	 --(%)
	  SELECT *  
	  FROM Employees 
	  WHERE EmployeeID%2=0 


--Where clause

  -- Finding rows by using a simple equality
     	SELECT *  
		FROM Employees 
		WHERE EmployeeID=101 

  -- Finding rows with two conditions
        SELECT *  
		FROM Employees 
		WHERE EmployeeID=101 AND LastName='Kochhar'

  --Comparison & Logical Operator
        --  Logical Operator AND
        SELECT *  
		FROM Employees 
		WHERE ManagerID=114 AND DepartmentID=30

		--  Logical Operator OR
		SELECT *  
		FROM Employees 
		WHERE ManagerID=114 OR DepartmentID=30


--Range Operator
    --BETWEEN
       	SELECT *  
		FROM Employees 
		WHERE Salary BETWEEN 1000 AND 4000

    --NOT BETWEEN
       SELECT *  
	   FROM Employees 
	   WHERE Salary NOT BETWEEN 1000 AND 4000

   
--In/not in keyword
    --IN
	 SELECT * 
	 FROM Employees 
	 WHERE JobId IN ('AD_VP','SH_CLERK')

    --NOT
	 SELECT * 
	 FROM Employees 
	 WHERE JobId  NOT IN ('AD_VP','SH_CLERK')


--Like, OrderBy, Top, Distinct
  --LIKE  
	 SELECT * 
	 FROM Employees 
	 WHERE PhoneNumber  LIKE '%123%'

  --ORDERBY 
      --DESC
     	 SELECT * 
		 FROM Employees 
		 ORDER BY Salary DESC
      --ASC
		 SELECT * 
		 FROM Employees 
		 ORDER BY Salary ASC



  --TOP
       --SELECT TOP 10 ROW
       SELECT TOP(10)*  FROM Employees

  --Distinct
         --LIST MANAGERID 
     	 SELECT DISTINCT ManagerID  FROM Employees ORDER BY ManagerID ASC


USE AdventureWorksDW2012

--Using SELECT to retrieve rows and columns
		SELECT *  
		FROM DimEmployee  
		ORDER BY LastName

		SELECT FirstName, LastName, StartDate AS FirstDay  
		FROM DimEmployee   
		WHERE EndDate IS NOT NULL   
		AND MaritalStatus = 'M'  
		ORDER BY LastName

--Using SELECT with column headings and calculations
        SELECT FirstName, LastName, BaseRate, BaseRate * 40 AS GrossPay  
		FROM DimEmployee  
		ORDER BY LastName

--Using DISTINCT with SELECT
        SELECT DISTINCT Title  
		FROM DimEmployee  
		ORDER BY Title  

--Using GROUP BY
        SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
		FROM FactInternetSales  
		GROUP BY OrderDateKey  
		ORDER BY OrderDateKey

--Using GROUP BY and WHERE
        SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
		FROM FactInternetSales  
		WHERE OrderDateKey > '20020801'  
		GROUP BY OrderDateKey  
		ORDER BY OrderDateKey

--Using the HAVING clause
        SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
		FROM FactInternetSales  
		GROUP BY OrderDateKey  
		HAVING OrderDateKey > 20010000  
		ORDER BY OrderDateKey  

--Using GROUP BY with ORDER BY
		SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
		FROM FactInternetSales  
		GROUP BY OrderDateKey  
		ORDER BY OrderDateKey 