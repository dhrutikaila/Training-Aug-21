------------------------UDF------------------------------
-- =============================================
-- Author:		<Deep Parmar>
-- Create date: <2021-09-07 14:31:33.383>
-- Description:	<Create User-defined Functions>
-- =============================================

------------------Scalar Functions------------------------------------
--Without Parameter
CREATE FUNCTION ufn_MIN_SalARY()
RETURNS INT
AS
    BEGIN 
       RETURN (SELECT MIN(Salary) FROM Employees)
    END


SELECT dbo.ufn_MIN_SalARY() AS MIN_Salary


--With Parameter
CREATE FUNCTION ufn_Cal(@Number INT)
RETURNS INT
AS
BEGIN
	RETURN(@Number * @Number)
END

SELECT dbo.ufn_Cal(2) AS SQARE_of_Number
----------------------------------------------------
CREATE FUNCTION ufn_AVG_SalARY(@JOB_ID VARCHAR(10))
RETURNS DECIMAL(8,2)
AS
    BEGIN 
       RETURN (SELECT AVG(Salary) FROM Employees WHERE JobId=@JOB_ID)
    END


SELECT dbo.ufn_AVG_SalARY('IT_PROG') AS Average_Salary

------------------Alter Function---------------------------------------

ALTER FUNCTION ufn_Cal(@Number INT)
RETURNS INT
AS
BEGIN
	RETURN(@Number * @Number * @Number)
END

SELECT dbo.ufn_Cal(2) AS Cube_of_Number

------------------Drop Function----------------------------------------
DROP FUNCTION dbo.ufn_Cal
--------------------default-------------------
CREATE FUNCTION Age_In_YEAR (
   @birth_date DATETIME,
   @Today DATETIME = NULL
   )
   RETURNS INT
AS BEGIN
   IF @Today IS NULL SET @Today = GETDATE()
   RETURN DATEDIFF(YY, @birth_date, @Today)
END

SELECT dbo.Age_In_YEAR('2000-01-14',NULL)

------------------Inline Table-Valued Functions------------------------------
CREATE FUNCTION Sales.ufn_SalesByStore (@storeid int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total'  
    FROM Production.Product AS P   
    JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
    JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
    JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
    WHERE C.StoreID = @storeid  
    GROUP BY P.ProductID, P.Name  
)

SELECT * FROM Sales.ufn_SalesByStore (602)
------------------------------------------------------------------------------
CREATE FUNCTION ufn_EmployeesSalary(@Department_Name VARCHAR(30))
RETURNS TABLE
AS
	RETURN(SELECT DEPARTMENT_NAME,SUM(Salary) AS Total_Salary_ToPay FROM Employees AS EMP
			JOIN departments AS DEPT
			ON DEPT.DEPARTMENT_ID=EMP.DepartmentID
			WHERE DEPARTMENT_NAME=@Department_Name
			GROUP BY DEPARTMENT_NAME)

SELECT * FROM dbo.ufn_EmployeesSalary('IT')


------------------ Multi-Statement Table Valued Function------------------------------
ALTER FUNCTION ufn_EmpSalaryIncrease(@JobId VARCHAR(10))
RETURNS @Employee TABLE
(
   EmployeeID DECIMAL(6,0) ,
	FirstName VARCHAR(20),
	LastName VARCHAR(25),
	Email VARCHAR(25),
	PhoneNumber VARCHAR(20),
	HireDate DATE,
	JobId VARCHAR(10),
	Salary DECIMAL(8,2),
	ManagerID DECIMAL(6,0),
	DepartmentID DECIMAL(4,0),
	DepartmentName VARCHAR(30)
)
AS
BEGIN
	INSERT INTO @Employee
	SELECT [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[PhoneNumber]
      ,[HireDate]
      ,[JobId]
      ,[Salary]
      ,[ManagerID]
      ,[DepartmentID]
	  ,DEPT.DEPARTMENT_NAME
  FROM Employees AS EMP
  JOIN departments AS DEPT ON EMP.DepartmentID=DEPT.DEPARTMENT_ID
  WHERE JobId=@JobId

  UPDATE @Employee SET Salary=Salary+(dbo.ufn_AVG_SalARY(@JobId)-Salary)          ----Multiple User Defined Functions in SQL Server
  WHERE JobId=@JobId AND Salary<dbo.ufn_AVG_SalARY(@JobId)
  RETURN
END

SELECT * FROM ufn_EmpSalaryIncrease('IT_PROG') 
